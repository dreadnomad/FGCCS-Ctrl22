/*
 * atmevse.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * Core module
 */ 

/* TODO:
 * - Port PIC code to ATmega -> WIP
 *  - Work out State B & C conditions and functions
 *  - Get a timer to work
 * - Build application for hardware testing -> mostly done
 */

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include "uart.h"
#include "cmd.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdint-gcc.h>
#include <stdio.h>
#include <string.h>

/*
    Globals
    *************************************************/
/* externally modifiable parameters */
uint16_t ctVal[] = {0, 0, 0};
uint16_t Irms[] = {0, 0, 0};            // RMS current per Phase [A * 10] (23 = 2.3A)
uint16_t ppVal = 0;
uint16_t cpVal= 0;
uint8_t pilot = PILOT_NOK;
uint16_t temperature = 0;
uint8_t dutyCycle = 50;
uint32_t systime = 0;
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

/* Calibration values for internal temperature sensor */
static int8_t sigrow_offset;
static uint8_t sigrow_gain;
/* PWM last duty cycle */
static uint8_t duty_cycle_old = 0;
/* input string for polling-based UART */
static char *input;

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
    {"read_temp", *readTemp}
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
    {"access", &access, 8}
};

/* RX and TX ringbuffers */
ringbuffer_t rxbuffer;
ringbuffer_t txbuffer;

/*
    Function definitions
    *************************************************/

void init(void) {
    /* System init */
    CPU_CCP = CCP_IOREG_gc;
    CPUINT.CTRLA &= ~CPUINT_IVSEL_bm;
    CPU_CCP = CCP_IOREG_gc;                                             // enable writing to protected register
    CLKCTRL.MCLKCTRLB = (CLKCTRL_PDIV_2X_gc | CLKCTRL_PEN_bm);          // set prescaler to 2 and enable it
    
    uint16_t i = 0;
    while (i < UINT16_MAX) {                      // wait for clock to stabilize
        i++;
    }
    /* GPIO init */
    /* control LED on PD3 -> Output, default low (off) */
    PORTD.DIRSET = LED;
    /* Button on PD4 -> Input */
    PORTD.DIRCLR = BUTTON;
    /* Button interrupt config: disable Pullup, sense rising edge */
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
    /* Set PA2 to output, default: low */
    PORTA.DIRSET = PWM_OUT;
    PORTA.OUTCLR = PWM_OUT;                                
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
    
    /* ADC init */
    /* Get calibration values from SIGROW */
    sigrow_offset = SIGROW.TEMPSENSE1;
    sigrow_gain = SIGROW.TEMPSENSE0;
    /* Set VREF to 1.1V for temperature sensor */
    VREF.CTRLA |= VREF_ADC0REFSEL_1V1_gc;
    VREF.CTRLB |= VREF_ADC0REFEN_bm;
    /* Set ADC prescaler to 4 and reference to VDD */
    ADC0.CTRLC |= (ADC_PRESC_DIV64_gc | ADC_REFSEL_VDDREF_gc);
    /* 16 Clock cycle init delay on ADC startup */
    ADC0.CTRLD |= ADC_INITDLY_DLY0_gc;
    /* Set up sampling length and capacitance (important for tempsens) */
    ADC0.SAMPCTRL = 5;
    ADC0.CTRLC |= ADC_SAMPCAP_bm;
    /* Set ADC Resolution to 10bit and enable ADC */
    ADC0.CTRLA |= (ADC_RESSEL_10BIT_gc | ADC_ENABLE_bm);
     
    /* uart init */
    #ifdef ATMEVSE_UART_H
        uart_init();
    #endif
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
    _delay_ms(300);                 // 300ms pulse
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
    if ((ppVal > 394) && (ppVal < 434)) {           // 680R: Max Capacity 16A
        maxCapacity = 16;
    }
    else if ((ppVal > 175) && (ppVal < 193)) {      // 220R: Max Capacity 32A
        maxCapacity = 32;
    }
    else if ((ppVal > 88) && (ppVal < 98)) {        // 100R: Max Capacity 63A
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

int8_t readTemp() {
    /* Temporarily disable ADC */
    ADC0.CTRLA &= ~ADC_ENABLE_bm;
    /* Setup ADC module */
    ADC0.CTRLC |= ADC_REFSEL_INTREF_gc;
    ADC0.MUXPOS = ADC_MUXPOS_TEMPSENSE_gc;
    ADC0.CTRLD |= ADC_INITDLY_DLY16_gc;
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
    temperature = temp;
    /* Reset ADC */
    ADC0.CTRLA &= ~ADC_ENABLE_bm; 
    ADC0.CTRLC |= ADC_REFSEL_VDDREF_gc;
    ADC0.CTRLD |= ADC_INITDLY_DLY0_gc;
    ADC0.CTRLA |= ADC_ENABLE_bm;
    
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    return 0;
}            

/* ISR */
ISR(PORTD_PORT_vect) {    
    led_toggle();
    PORTD.INTFLAGS |= PORT_INT4_bm;
}

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
    uint16_t pwm_count = 0;
#ifdef TESTING
//     pwm_on();
//     pwm_set_duty_cycle(10);
    while (1) {
/*        pwm_count = TCA0.SINGLE.CNT;*/
        input = uart0_readLine();
        cmd_parse(input);
//         if ((TCA0 > 1) && (pwm_count < 30)) {
//             readCP();
//             printf("CP high level: %d\r\n", cpVal);
//         }
//         if ((TCA0.SINGLE.CNT > 600) && (TCA0.SINGLE.CNT < 620)) {
//             readCP();
//             printf("CP low level: %d\r\n", cpVal);
//         }
        ;
    }
#endif
#ifdef PRODUCTION
    while (1) {
        /* EVSE STATE A - No Vehicle connected */
        if (state == STATE_A) {
            /* Turn off PWM and set PWM output to static +12V*/
            pwm_off();
            PORTA.OUTSET = PWM_OUT;
            all_ssr_off();
            readCP();
            
            /* Check if vehicle disconnected / forced to State A and clear errors */
            if (pilot == PILOT_12V) {
                error &= ~(LESS_MIN_CURRENT);
                chargeDelay = 0;
            }
            
            /* Switch to State B? */
            if (pilot == PILOT_9V) {
                /* Access to charging is only permitted if access == 1 */
                if ((nextState == STATE_B) && access) {
                    /* Repeat 25 times to ensure all is OK */
                    if ((count++ > 25) && (error == NO_ERROR) && (chargeDelay == 0)) {
                        diodeCheck = 0;
                        readPP();
                        if (maxCurrent > maxCapacity) {
                            chargeCurrent = maxCapacity * 10;
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
        
        /* EVSE STATE B - Vehicle connected, not ready for charging */
        if (state == STATE_B) {
            /* TODO: find condition to measure CP while PWM output is high */
            if (1) {
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
                    if ((nextState == STATE_C) && (diodeCheck == 1)) {
                        if (count++ > 25) {
                            if ((error == NO_ERROR) && (chargeDelay == 0)) {
                                /* TODO: check for available current */
                                /* TODO: calculate current */
                                all_ssr_on();
                                diodeCheck = 0;
                                state = STATE_C;
                                DEBUG_PRINT("STATE B -> C\r\n");
                                /* TODO if no current available -> error |= NO_CURRENT */
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
            /* TODO: find condition to measure CP while PWM output is low */
            if (1) {
                readCP();
                if (pilot == PILOT_DIODE) {
                    diodeCheck = 1;
                }
                else {
                    diodeCheck = 0;
                }                
            }
        }
        
        /* EVSE STATE C - Vehicle connected, ready for charging */
        if (state == STATE_C) {
            
        }
    }
#endif
}

