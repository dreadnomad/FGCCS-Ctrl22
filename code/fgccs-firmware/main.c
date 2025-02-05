/*
 * main.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : Pascal Thurnherr
 * 
 * FGCCS-Ctrl22 firmware for EV supply equipment
 * Core module
 * 
 * This work builds on the SmartEVSE project. All parts of this software that contain code from the 
 * original SmartEVSE sources is released as required with the copyright notice below.
 * 
     (C) 2013-2016  Michael Stegen / Stegen Electronics
 
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
 * 
 * 
 */ 

/*
    Includes
    *************************************************/
#include "main.h"
#include "uart.h"
#include "cmd.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdint-gcc.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

/*
    Globals
    *************************************************/
/* externally modifiable parameters */
uint16_t ctVal[] = {512, 512, 512};
uint16_t Irms[] = {0, 0, 0};            // RMS current per Phase [A * 10] (23 = 2.3A)
uint16_t ppVal = 0;
uint16_t cpVal= 0;
uint8_t pilot = PILOT_NOK;
uint16_t temperature = 0;
uint8_t dutyCycle = 50;
uint32_t systime = 0;
uint32_t sectime = 0;
uint16_t auxTimer1 = 0;
uint16_t auxTimer2 = 0;;
volatile uint8_t buttonstate = 0;
uint8_t lockstate = 0;
uint16_t Ical = ICAL;
uint8_t maxMains = MAX_MAINS;
uint8_t maxCurrent = MAX_CURRENT;
uint8_t minCurrent = MIN_CURRENT;
uint8_t mode = MODE;
uint8_t lock = LOCK_MODE;
uint8_t cableConf = CABLE_CONF;
uint8_t switchMode = SWITCH;
uint8_t state = STATE_A;
uint8_t error = NO_ERROR;
uint8_t nextState = STATE_A;
uint8_t maxCapacity = 0;                // Max current capability of the cable
uint16_t chargeCurrent;                 // Calculated charging current [A * 10]
uint16_t Imeasured = 0;                 // Max measured current in all phases [A * 10]
uint16_t Isum = 0;                      // Sum of all measured phase currents [A * 10]
uint8_t chargeDelay = CHARGEDELAY;
uint8_t access = 0;
uint8_t runlevel = 0;

/* Calibration values for internal temperature sensor */
static int8_t sigrow_offset;
static uint8_t sigrow_gain;

uint8_t access_lock = 0;
uint16_t mstime = 0;

/* PWM last duty cycle */
static uint8_t duty_cycle_old = 0;

/* UART variables */
char input[MAX_LINE_LEN];
uint8_t rxflag = 0;
uint8_t idx = 0;

/* Current measurement globals */
double tempIrms[NO_PHASE];
int16_t lastSampleI, sampleI, tempI;        // sample holds ADC value
int32_t filteredI, filtI_div4, tempL;
int64_t sqI;
int32_t filteredCT[3] = {0, 0, 0};

/* CMD and PARAM tables */
cmd_table_t cmd_table[NO_CMD] = {
    {"status", *sys_status},
    {"param_get", *param_get},
    {"param_set", *param_set},
    {"led_on", *led_on},
    {"led_off", *led_off},
    {"led_toggle", *led_toggle},
    {"pwm_on", *pwm_on},
    {"pwm_off", *pwm_off},
    {"ssr1_on", *ssr1_on},
    {"ssr1_off", *ssr1_off},
    {"ssr2_on", *ssr2_on},
    {"ssr2_off", *ssr2_off},
    {"ssr3_on", *ssr3_on},
    {"ssr3_off", *ssr3_off},
    {"all_ssr_on", *all_ssr_on},
    {"all_ssr_off", *all_ssr_off},
    {"lock_cable", *lock_cable},
    {"unlock_cable", *unlock_cable},
    {"lock_off", *lock_off},
    {"relay_on", *relay_on},
    {"relay_off", *relay_off},
    {"read_cp", *readCP},
    {"read_pp", *readPP},
    {"read_ct", *readCT},
    {"measureCurrent", *measureCurrent},
    {"read_temp", *readTemp},
    {"pp_ohm", *pp_ohm},
    {"cp_volt", *cp_volt}
};

param_table_t param_table[NO_PARAM] = {
    {"ct0Val", &ctVal[0], 16},
    {"ct1Val", &ctVal[1], 16},
    {"ct2Val", &ctVal[2], 16},
    {"Irms0", &Irms[0], 16},
    {"Irms1", &Irms[1], 16},
    {"Irms2", &Irms[2], 16},
    {"ppVal", &ppVal, 16},
    {"cpVal", &cpVal, 16},
    {"pilot", &pilot, 8},
    {"temperature", &temperature, 16},
    {"dutyCycle", &dutyCycle, 8},
    {"systime", &systime, 32},
    {"sectime", &sectime, 32},
    {"auxTimer1", &auxTimer1, 16},
    {"auxTimer2", &auxTimer2, 16},
    {"lockstate", &lockstate, 8},
    {"buttonstate", &buttonstate, 8},
    {"Ical", &Ical, 16},
    {"maxMains", &maxMains, 8},
    {"maxCurrent", &maxCurrent, 8},
    {"minCurrent", &minCurrent, 8},
    {"mode", &mode, 8},
    {"lock", &lock, 8},
    {"cableConf", &cableConf, 8},
    {"switchMode", &switchMode, 8},
    {"state", &state, 8},
    {"error", &error, 8},
    {"nextState", &nextState, 8},
    {"maxCapacity", &maxCapacity, 8},
    {"chargeCurrent", &chargeCurrent, 16},
    {"Imeasured", &Imeasured, 16},
    {"Isum", &Isum, 16},
    {"chargeDelay", &chargeDelay, 8},
    {"access", &access, 8},
    {"runlevel", &runlevel, 8}
};

/* RX and TX ringbuffers */
ringbuffer_t rxbuffer;
ringbuffer_t txbuffer;

/*
    Function definitions
    *************************************************/

void init(void) {
    /* System init */
    CPU_CCP = CCP_IOREG_gc;                                             // enable writing to protected register
    CLKCTRL.MCLKCTRLB = (CLKCTRL_PDIV_2X_gc | CLKCTRL_PEN_bm);          // set prescaler to 2 and enable it
    
    while (CLKCTRL.MCLKSTATUS & CLKCTRL_SOSC_bm) {
        ;
    }
    /* GPIO init */
    /* control LED on PD3 -> Output, default low (off) */
    PORTD.DIRSET = LED;
    /* Button on PD4 -> Input */
    PORTD.DIRCLR = BUTTON;
    /* Button interrupt config: disable Pullup, sense rising edge */
    PORTD.PIN4CTRL &= ~(PORT_ISC_gm);
    PORTD.PIN4CTRL |= PORT_ISC_RISING_gc;
    PORTD.PIN4CTRL &= ~PORT_PULLUPEN_bm;
    /* SSRs on PA4-6 -> Output, default low */
    PORTA.DIRSET = (SSR1 | SSR2 | SSR3);
    PORTA.OUTCLR = (SSR1 | SSR2 | SSR3);
    /* Signal relay (CP & PP) on PA3 -> Output, default low */
    PORTA.DIRSET = RELAY;
    PORTA.OUTCLR = RELAY;
    /* Lock drive A & B on PA7 and PC2 -> Output, default high, lock off */
    PORTA.DIRSET = LOCK_R;
    PORTA.OUTSET = LOCK_R;
    PORTC.DIRSET = LOCK_W;
    PORTC.OUTSET = LOCK_W;
    /* Lock state on PD2 -> Input */
    PORTD.DIRCLR = LOCK_B;
    PORTD.PIN2CTRL |= PORT_ISC_INTDISABLE_gc;
    /* Current transformers input 0, 1, 2 -> ADC input */
    PORTD.DIRCLR = CT0;
    PORTD.PIN5CTRL &= ~PORT_ISC_gm;
    PORTD.PIN5CTRL |= PORT_ISC_INPUT_DISABLE_gc;
    PORTD.PIN5CTRL &= ~PORT_PULLUPEN_bm;
    PORTD.DIRCLR = CT1;
    PORTD.PIN6CTRL &= ~PORT_ISC_gm;
    PORTD.PIN6CTRL |= PORT_ISC_INPUT_DISABLE_gc;
    PORTD.PIN6CTRL &= ~PORT_PULLUPEN_bm;
    PORTD.DIRCLR = CT2;
    PORTD.PIN7CTRL &= ~PORT_ISC_gm;
    PORTD.PIN7CTRL |= PORT_ISC_INPUT_DISABLE_gc;
    PORTD.PIN7CTRL &= ~PORT_PULLUPEN_bm;
    /* CP & PP -> ADC input */
    PORTD.DIRCLR = PP;
    PORTD.PIN0CTRL &= ~PORT_ISC_gm;
    PORTD.PIN0CTRL |= PORT_ISC_INPUT_DISABLE_gc;
    PORTD.PIN0CTRL &= ~PORT_PULLUPEN_bm;
    PORTD.DIRCLR = CP;
    PORTD.PIN1CTRL &= ~PORT_ISC_gm;
    PORTD.PIN1CTRL |= PORT_ISC_INPUT_DISABLE_gc;
    PORTD.PIN1CTRL &= ~PORT_PULLUPEN_bm;
    
    /* PWM init (using TCA, Dual Slope PWM) */
    /* Set Output Port to PORTA */
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTA_gc;
    /* Set PA2 to output, default: high */
    PORTA.DIRSET = PWM_OUT;
    PORTA.OUTSET = PWM_OUT;                                
    /* Setup TCA Clock and enable it */                                
    TCA0.SINGLE.CTRLA |= (TCA_PRESCALER_BM | TCA_SINGLE_ENABLE_bm);
    /* Set to dual slope PWM */
    TCA0.SINGLE.CTRLB |= TCA_SINGLE_WGMODE_DSBOTTOM_gc;
    /* Set timer to count clock ticks */
    TCA0.SINGLE.EVCTRL &= ~(TCA_SINGLE_CNTEI_bm);
    /* Setup TCA period for desired FREQUENCY */
    TCA0.SINGLE.PERBUF = PWM_PERIOD(PWM_FREQ);
    /* Setup duty cycle */
    TCA0.SINGLE.CMP2BUF = (uint16_t)((1.0/100) * dutyCycle * PWM_PERIOD(PWM_FREQ));
    duty_cycle_old = dutyCycle;
    /* Disable PWM output by default */
    TCA0.SINGLE.CTRLB &= ~TCA_SINGLE_CMP2EN_bm;
    
    /* RTC init (1ms counter) */
    RTC.CLKSEL |= RTC_CLKSEL_INT1K_gc;
    RTC.PITINTCTRL |= RTC_PI_bm;
    RTC.PITCTRLA |= RTC_PERIOD_CYC1024_gc;
    RTC.PITCTRLA |= RTC_PITEN_bm;
    
    /* Timer B init (1ms counter) */
    TCB0.CTRLA |= (TCB_CLKSEL_CLKTCA_gc);
    TCB0.CTRLB |= (TCB_CNTMODE_INT_gc);
    TCB0.EVCTRL &= ~(TCB_CAPTEI_bm);
    TCB0.INTCTRL |= TCB_CAPT_bm;
    TCB0.CCMP = 0xFFFF;
    TCB0.CTRLA |= TCB_ENABLE_bm;
    
    /* ADC init */
    /* Get calibration values from SIGROW */
    sigrow_offset = SIGROW.TEMPSENSE1;
    sigrow_gain = SIGROW.TEMPSENSE0;
    /* Set VREF to 1.1V for temperature sensor */
    VREF.CTRLA |= VREF_ADC0REFSEL_1V1_gc;
    VREF.CTRLB |= VREF_ADC0REFEN_bm;
    /* Set ADC prescaler to 8 and reference to VDD */
    ADC0.CTRLC |= (ADC_PRESC_DIV8_gc | ADC_REFSEL_VDDREF_gc);
    /* 0 Clock cycle init delay on ADC startup */
    ADC0.CTRLD |= ADC_INITDLY_DLY0_gc;
    /* Set up sampling length and capacitance (important for tempsens) */
    ADC0.SAMPCTRL = 64;
    ADC0.CTRLC |= ADC_SAMPCAP_bm;
    /* Set ADC Resolution to 10bit and enable ADC */
    ADC0.CTRLA |= (ADC_RESSEL_10BIT_gc | ADC_ENABLE_bm);
     
    /* uart init */
    #ifdef ATMEVSE_UART_H
        uart_init();
    #endif
    rxbuffer.read = 0;
    rxbuffer.write = 0;
}

int8_t led_toggle() {
    PORTD.OUTTGL = LED;
    return 0;
}

int8_t led_on() {
    PORTD.OUTSET = LED;
    return 0;
}

int8_t led_off() {
    PORTD.OUTCLR = LED;
    return 0;
}

int8_t pwm_on() {
    TCA0.SINGLE.CTRLB |= TCA_SINGLE_CMP2EN_bm;
    return 0;
}

int8_t pwm_off() {
    TCA0.SINGLE.CTRLB &= ~TCA_SINGLE_CMP2EN_bm;
    PORTA.OUTSET = PWM_OUT;
    return 0;
}

int8_t pwm_set_duty_cycle(uint8_t duty_cycle) {
    /* Check for valid duty cycle in % */
    if (duty_cycle <= 100) {
        TCA0.SINGLE.CMP2BUF = (uint16_t)((1.0/100) * duty_cycle * PWM_PERIOD(PWM_FREQ));
        return 0;        
    } 
    else {
        return -1;
    }
}

int8_t set_current(uint16_t current) {
    /* Current over 6A and under 51A */
    if ((current >= 60) && (current <= 510)) {
        dutyCycle = (uint8_t)(current / 6);
    }    
    /* Current above 51A: dutyCycle = (Current / 25) + 64 */
    else if ((current > 510) && (current <= 800)) {
        dutyCycle = (uint8_t)(current / 25) + 64;
    }
    /* If invalid current: use 6A */
    else {
        dutyCycle = 10;
    }
    pwm_set_duty_cycle(dutyCycle);
    return 0;
}


int8_t ssr1_on() {
    PORTA.OUTSET = SSR1;
    return 0;
}

int8_t ssr1_off() {
    PORTA.OUTCLR = SSR1;
    return 0;
}

int8_t ssr2_on() {
    PORTA.OUTSET = SSR2;
    return 0;
}

int8_t ssr2_off() {
    PORTA.OUTCLR = SSR2;
    return 0;   
}

int8_t ssr3_on() {
    PORTA.OUTSET = SSR3;
    return 0;    
}

int8_t ssr3_off() {
    PORTA.OUTCLR = SSR3;
    return 0;    
}

int8_t all_ssr_on() {
    ssr1_on();
    ssr2_on();
    ssr3_on();
    return 0;
}

int8_t all_ssr_off() {
    ssr1_off();
    ssr2_off();
    ssr3_off();
    return 0;
}

int8_t lock_cable() {
    /* Lock cable: R = 12V, W = 0V */
    PORTA.OUTSET = LOCK_R;
    PORTC.OUTCLR = LOCK_W;
    _delay_ms(500);                 // 300ms pulse
    /* Pulse off: R = W = 12V */
    lock_off();
    /* Check lock state */
    lockstate = (PORTD.IN & LOCK_B) ? 1 : 0;
    if (lockstate == 1) {
        return 0;                   // OK
    }
    else {
        return -2;                  // FAIL
    }
}

int8_t unlock_cable() {
    /* Unlock cable: R = 0V, W = 12V */
    PORTA.OUTCLR = LOCK_R;
    PORTC.OUTSET = LOCK_W;
    _delay_ms(300);                 // 300ms pulse
    /* Pulse off: R = W = 12V */
    lock_off();
    /* Check lock state */
    lockstate = (PORTD.IN & LOCK_B) ? 1 : 0;
    if (lockstate == 0) {
        return 0;                   // OK
    }
    else {
        return -2;                  // FAIL
    }
}

int8_t lock_off() {
    PORTA.OUTSET = LOCK_R;
    PORTC.OUTSET = LOCK_W;
    return 0;
}

int8_t relay_on() {
    PORTA.OUTSET = RELAY;
    return 0;
}

int8_t relay_off() {
    PORTA.OUTCLR = RELAY;
    return 0;
}

int8_t readCP() {
    /* Sample control pilot to check for vehicle status */
    ADC0.MUXPOS = CP_AIN;   
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    cpVal = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    if (cpVal > 980) {                                // CP at > 11V
        pilot = PILOT_12V;
    }
    else if ((cpVal > 860) && (cpVal < 915)) {      // CP at 9V
        pilot = PILOT_9V;
    }
    else if ((cpVal > 720) && (cpVal < 800)) {      // CP at 6V
        pilot = PILOT_6V;
    }
    else if ((cpVal > 25) && (cpVal < 95)) {        // Diode Check OK
        pilot = PILOT_DIODE;
    }
    else {
        pilot = PILOT_NOK;                              // Pilot not OK
    }
    return 0;
}

int8_t readPP() {
    ADC0.MUXPOS = PP_AIN;  
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    ppVal = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    maxCapacity = 13;                                   // No Resistor: Max Capacity 13A
    if ((ppVal > 260) && (ppVal < 480)) {           // 680R: Max Capacity 20A
        maxCapacity = 20;
    }
    else if ((ppVal > 150) && (ppVal < 220)) {      // 220R: Max Capacity 32A
        maxCapacity = 32;
    }
    else if ((ppVal > 75) && (ppVal < 120)) {        // 100R: Max Capacity 63A
        maxCapacity = 63;
    }
    if (cableConf) {
        maxCapacity = maxCurrent;                   // Fixed cable: override with MAX_CURRENT
    }
    return 0;
}

int8_t readCT() {
    /* Read CT0 value (PD5 -> AIN5)*/
    ADC0.MUXPOS = CT0_AIN;
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    ctVal[0] = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    
    /* Read CT1 value (PD6 -> AIN6)*/
    ADC0.MUXPOS = CT1_AIN;
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    ctVal[1] = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    
    /* Read CT2 value (PD7 -> AIN7)*/
    ADC0.MUXPOS = CT2_AIN;
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    ctVal[2] = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    return 0;
}

int8_t measureCurrent() {
    int32_t sumI = 0;
    
/*    led_on();*/
    for (uint16_t ct = 0; ct < NO_PHASE; ct++) {
        
        /* Get sample and filter values */
        sampleI = ctVal[ct];
        filteredI = filteredCT[ct];
        
        for (uint16_t n = 0; n < SAMPLES; n++) {
            readCT();
            lastSampleI = sampleI;
            sampleI = ctVal[ct];
            tempI = sampleI - lastSampleI;
            tempL = (uint32_t)tempI << 8;
            tempL += filteredI;
            filteredI = tempL - (tempL >> 8);
            
            filtI_div4 = filteredI >> 2;
            sqI = filtI_div4 * filtI_div4;
            sqI = sqI >> 12;
            sumI += sqI;
        }    
        ctVal[ct] = sampleI;
        filteredCT[ct] = filteredI;
        tempIrms[ct] = sqrt((double)sumI/SAMPLES);
    }
    
    for (uint8_t i = 0; i < NO_PHASE; i++) {
        Irms[i] = (uint16_t)(tempIrms[i] * 10);
    }
/*    led_off();*/
    return 0;
    
}

int8_t readTemp() {
    /* Temporarily disable ADC */
    ADC0.CTRLA &= ~ADC_ENABLE_bm;
    /* Setup ADC module */
    ADC0.CTRLC |= ADC_REFSEL_INTREF_gc;
    ADC0.MUXPOS = ADC_MUXPOS_TEMPSENSE_gc;
    ADC0.CTRLD |= ADC_INITDLY_DLY64_gc;
    /* Reenable ADC */
    ADC0.CTRLA |= ADC_ENABLE_bm;
    /* delay until ADC is stabilized */
    _delay_us(100);
    /* Read Temperature sensor value */
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    uint16_t adcVal = ADC0.RES;
    /* Calculate temperature in Kelvin (32bit temporary variable to avoid overflow) */
    uint32_t temp = (adcVal - sigrow_offset);
    temp *= sigrow_gain;
    temp += 0x80;
    temp >>= 8;
    temperature = temp;     // Temp in Kelvin
    /* Reset ADC */
    ADC0.CTRLA &= ~ADC_ENABLE_bm; 
    ADC0.CTRLC |= ADC_REFSEL_VDDREF_gc;
    ADC0.CTRLD |= ADC_INITDLY_DLY0_gc;
    ADC0.CTRLA |= ADC_ENABLE_bm;
    
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    return 0;
}    

int8_t toggle_access() {
    if (access_lock == 0) {
	    if (access == 0) {
	        access = 1;
	    }
	    else if (access == 1) {
	        access = 0;
	    }
    }
    return 0;
}        

int8_t pp_ohm() {
    /* Calculate resistor value from ADC value */
    readPP();
    float rtemp = (1000 * ((float)ppVal / 1024)) / (1 - ((float)ppVal / 1024));
    uint16_t r = (uint16_t)rtemp;
    printf("R_PP = %d\r\n", r);
    return 0;
}

int8_t cp_volt() {
    /* Calculate voltage on cp line from ADC value */
    readCP();
    float tempvolt = (((float)cpVal / 1024) * 24) - 12;
    uint16_t volt = (uint16_t)tempvolt;
    printf("V_CP = %d\r\n", volt);
    return 0;
}

/* ISR */
// ISR(PORTD_PORT_vect) {    
//     led_toggle();
//     PORTD.INTFLAGS = PORT_INT4_bm;
// }
// 
// ISR(TCB0_INT_vect) {
//     mstime++;
//     systime++;
//     led_toggle();
//     TCB0.INTFLAGS = TCB_CAPT_bm;
// }
// 
// ISR(USART0_RXC_vect) {
//     char c = USART0_RXDATAL;
//     if ((c != '\r') && (c != '\n')) {
//         rxbuffer.data[rxbuffer.write++] = c;
//     }
//     if (c == '\n') {
//         rxbuffer.data[rxbuffer.write++] = '\0';
//         rxflag = 1;
//         }   
// }

/*
    Application
    *************************************************/
int main(void) {
    init();
    sei();
    
    /* Main variables */
    uint8_t count = 0;
    uint8_t diodeCheck = 0;
    uint8_t timeout = 5;
    uint8_t buttonstate_old = 0;
    uint8_t lockAttempts = 0;
    uint8_t unlockAttempts = 0;

#ifdef TESTING
    runlevel = 0;
    DEBUG_PRINT("TEST MODE...\r\n");
    char *line;
    while (1) {
        line = uart0_readLine();
        cmd_parse(line);
    }
#endif
#ifdef PRODUCTION
    runlevel = 1;
    DEBUG_PRINT("PRODUCTION MODE...\r\n");
    DEBUG_PRINT("INITIALIZED...\r\n");
    DEBUG_PRINT("CURRENT STATE: A...\r\n");
    if (!SWITCH) {
        access = 1;
        DEBUG_PRINT("ACCESS BIT SET TO 1...\r\n");
    }
    else {
        access = 0;
    }
    while (1) {
        
        /* Check for new char in RX buffer */
        uart0_readLoop();
        if (rxflag == 1) {
            cmd_parse(input);
            rxflag = 0;
            input[0] = '\0';
        }
        
        /* EVSE STATE A - No Vehicle connected */
        if (state == STATE_A) {
            /* Turn off PWM and set PWM output to static +12V*/
            pwm_off();
            PORTA.OUTSET = PWM_OUT;
            all_ssr_off();
            readCP();
            /* Unlock cable in socket */
            if (LOCK_MODE) {
	            if ((lockstate == 1) && ((error & UNLOCK_FAILED) == 0)) {
	                unlock_cable();
	                if ((lockstate == 1)) {
	                    unlockAttempts++;
	                    if (unlockAttempts >= MAX_UNLOCK_ATTEMPTS) {
	                        error |= UNLOCK_FAILED;
	                        DEBUG_PRINT("MAX UNLOCK ATTEMPTS EXCEEDED, PLEASE UNLOCK MANUALLY...\r\n");
	                    }
	                }
	                else {
	                    unlockAttempts = 0;
	                }
	            }
            }
            /* Check if vehicle disconnected / forced to State A and clear errors */
            if (pilot == PILOT_12V) {
                error &= ~(LESS_MIN_CURRENT);
                chargeDelay = 0;
            }
            
            /* Switch to State B? */
            if (pilot == PILOT_9V) {
                /* Access to charging is only permitted if access == 1 */
                if ((nextState == STATE_B)) {
                    /* Repeat 25 times to ensure all is OK */
                    if ((count++ > 25) && (error == NO_ERROR) && (chargeDelay == 0)) {
                        diodeCheck = 0;
                        readPP();
                        if (maxCurrent > maxCapacity) {
                            chargeCurrent = maxCapacity;
                        }
                        else {
                            chargeCurrent = maxCurrent;
                        }
                        state = STATE_B;
                        DEBUG_PRINT("STATE A -> B\r\n");
                    }
                }
                else {
                    nextState = STATE_B;
                    count = 0;
                }
            } 
        }
        /* END OF STATE A */
        
        /* Check for new char in RX buffer */
        uart0_readLoop();
        if (rxflag == 1) {
            cmd_parse(input);
            rxflag = 0;
            input[0] = '\0';
        }
        
        /* EVSE STATE B - Vehicle connected, not ready for charging */
        if (state == STATE_B) {
            /* Set current and enable PWM */
            set_current(chargeCurrent * 10);
            pwm_on();
            /* Check at beginning of PWM period for high level */
            if ((TCA0.SINGLE.CNT > 1) && (TCA0.SINGLE.CNT < 30)) {
                readCP();
                /* Disconnected? */
                if (pilot == PILOT_12V) {
                    if (nextState == STATE_A) {
                        if (count++ > 25) {
                            state = STATE_A;
                            DEBUG_PRINT("STATE B -> A\r\n");
                        }
                    }
                    else {
                        nextState = STATE_A;
                        count = 0;
                    }
                }
                else if (pilot == PILOT_6V) {
                    if ((nextState == STATE_C) && (diodeCheck == 1) && (access == 1)) {
                        if (count++ > 25) {
                            if ((error == NO_ERROR) && (chargeDelay == 0)) {
                                all_ssr_on();
                                diodeCheck = 0;
                                state = STATE_C;
                                DEBUG_PRINT("STATE B -> C\r\n");
                                /* Lock cable in socket */
                                if (LOCK_MODE) {
	                                if ((lockstate == 0) && ((error & LOCK_FAILED) == 0)) {
	                                    lock_cable();
	                                    if (lockstate == 0) {
	                                        lockAttempts++;
	                                        if (lockAttempts >= MAX_LOCK_ATTEMPTS) {
	                                            error |= LOCK_FAILED;
	                                            DEBUG_PRINT("MAX LOCK ATTEMPTS EXCEEDED...\r\n");
	                                        }
	                                    }
	                                    else {
	                                        lockAttempts = 0;
	                                    }
	                                } 
                                }
                            }
                        }
                    }
                    else {
                        nextState = STATE_C;
                        count = 0;
                    }
                }
                /* PILOT_9V */
                else {
                    if (nextState == STATE_B) {
                        /* Either no current available or charging was finished -> Wait for EV to disconnect */
                    }
                    else {
                        /* No state to switch to */
                        nextState = 0;
                    }
                }
            }
            /* Check at the end of PWM period for low level */
            if (TCA0.SINGLE.CNT > 550) {
                while (TCA0.SINGLE.CNT < 600);                              // Blocking, so low level is not missed at high duty cycles                  
	            if ((TCA0.SINGLE.CNT > 600) && (TCA0.SINGLE.CNT < 620)) {
	                readCP();
	                if (pilot == PILOT_DIODE) {
	                    diodeCheck = 1;
	                }
	                else {
	                    diodeCheck = 0;
	                }                
	            }
            }
        }
        /* END OF STATE B */
        /* Check for new char in RX buffer */
        uart0_readLoop();
        if (rxflag == 1) {
            cmd_parse(input);
            rxflag = 0;
            input[0] = '\0';
        }
             
        /* EVSE STATE C - Vehicle connected, ready for charging */
        if (state == STATE_C) {
            
            /* Measure CP at ~5% of PWM cycle */
            if ((TCA0.SINGLE.CNT > 1) && (TCA0.SINGLE.CNT < 30)) {
                readCP();
                /* Disconnect or Error? */
                if ((pilot == PILOT_12V) || (pilot == PILOT_NOK)) {
                    if (nextState == STATE_A) {
                        if (count++ > 25) {
                            all_ssr_off();
                            state = STATE_A;
                            DEBUG_PRINT("STATE C -> A\r\n");
                        }
                    }
                    else {
                        nextState = STATE_A;
                        count = 0;
                    }
                }
                /* No charge requested by EV */
                else if (pilot == PILOT_9V) {
                    if (nextState == STATE_B) {
                        if (count++ > 25) {
                            all_ssr_off();
                            state = STATE_B;
                            DEBUG_PRINT("STATE C -> B\r\n");
                            diodeCheck = 0;
                        }
                    }
                    else {
                        nextState = STATE_B;
                        count = 0;
                    }
                }
                
                /* No state to switch to */
                else {
                    if (access != 1) {
                        /* Charge manually stopped */
                        if (nextState == STATE_B) {
                            if (count++ > 25) {
                                all_ssr_off();
                                state = STATE_B;
                                DEBUG_PRINT("STATE C -> B\r\n");
                                diodeCheck = 0;
                            }
                        }
                        else {
                            nextState = STATE_B;
                            count = 0;
                        }
                    }
                    else {
                        nextState = 0;
                    }
                   
                }                
            }
        }
        /* END OF STATE C */
        
        /* UART reading and command parsing section */
        uart0_readLoop();
        if (rxflag == 1) {
            cmd_parse(input);
            rxflag = 0;
            input[0] = '\0';
        }
        
        /* Millisecond timer */
        if (TCB0.CNT >= 1250) {
            systime++;
            mstime++;
            TCB0.CNT = 0;
        }
        /* Seconds timer */
        /* Periodic actions */
        if (mstime >= 1000) {
            mstime = 0;
            sectime++;
            readTemp();
            
            if (temperature >= MAX_TEMP) {
                error |= TEMP_HIGH; 
                state = STATE_A;            // Error, stop charging
                DEBUG_PRINT("Overtemperature condition detected...stopping charge. \r\n");
            }
            if ((temperature < (MAX_TEMP - 10)) && (error & TEMP_HIGH)) {
                error &= ~TEMP_HIGH;        // Clear error on cooling down
            }
            
            /* Periodically check for changed chargeCurrent */
            if ((chargeCurrent != maxCurrent) && (chargeCurrent <= maxCapacity)) {
                set_current(chargeCurrent * 10);
            }
            /* Current measurement */
            measureCurrent();
//             for (uint8_t n = 0; n < NO_PHASE; n++) {
//                 printf("Current Phase %d = %d\r\n", n, Irms[n]);            
//             }
            /* Check for manual unlocking */
            if(LOCK_MODE) {
                if ((lockstate == 0) && (error & UNLOCK_FAILED)) {
                    error &= ~UNLOCK_FAILED;
                    unlockAttempts = 0;
                }
            }
            access_lock = 0;            
        }
        
        /* Get buttonstate */
        buttonstate = (PORTD.IN & BUTTON) ? 1 : 0;
        /* Detect state change with debouncing */
        if (buttonstate != buttonstate_old) {
            _delay_ms(80);
            buttonstate = (PORTD.IN & BUTTON) ? 1 : 0;
            if (buttonstate != buttonstate_old) {
                /* detect rising edge, lock access toggling for 1sec. */
                if (buttonstate == 1) {
                    toggle_access();
                    access_lock = 1;                    
                }

            }
        }
        buttonstate_old = buttonstate;
    }
#endif
}

