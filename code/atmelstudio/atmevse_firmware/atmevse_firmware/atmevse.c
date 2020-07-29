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
 * - Port PIC code to ATmega
 * - Build application for hardware testing
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
uint8_t duty_cycle = 50;
uint8_t duty_cycle_old;
uint32_t systime;
uint8_t intcnt = 0;
uint8_t buttonstate = 0;
uint8_t lockstate = 0;

cmd_table_t cmd_table[CMD_NO] = {
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
                                {"lock", *lock},
                                {"unlock", *unlock},
                                {"lock_off", *lock_off},
                                {"relay_on", *relay_on},
                                {"relay_off", *relay_off}
                                };
param_table_t param_table[PARAM_NO] = {
                                        {"duty_cycle", &duty_cycle, 8},
                                        {"duty_cycle_old", &duty_cycle_old, 8},
                                        {"systime", &systime, 32},
                                        {"intcnt", &intcnt, 8}, 
                                        {"lockstate", &lockstate, 8},
                                        {"buttonstate", &buttonstate, 8}                                       
                                        };
    
/*
    Function definitions
    *************************************************/

/* ISR */

ISR(PORTD_PORT_vect) {    
    buttonstate = buttonstate ? 0 : 1;
    PORTD.INTFLAGS |= PORT_INT4_bm;
}

void init(void) {
    /* System init */
    CPU_CCP = CCP_IOREG_gc;
    CPUINT.CTRLA &= ~CPUINT_IVSEL_bm;
    CPU_CCP = CCP_IOREG_gc;                                             // enable writing to protected register
    CLKCTRL.MCLKCTRLB = (CLKCTRL_PDIV_2X_gc | CLKCTRL_PEN_bm);          // set prescaler to 2 and enable it
//     while (CLKCTRL.MCLKSTATUS & CLKCTRL_SOSC_bm) {                      // wait for clock to stabilize
//         ;
//     }
    uint16_t i = 0;
    while (i < UINT16_MAX) {                      // wait for clock to stabilize
        i++;
    }
    /* GPIO init */
    /* control LED on PD3 -> Output, default low (off) */
    PORTD.DIRSET = PIN3_bm;
    /* Button on PD4 -> Input */
    PORTD.DIRCLR = PIN4_bm;
    /* Button interrupt config: disable Pullup, sense rising edge */
    PORTD.PIN4CTRL |= PORT_ISC_RISING_gc;
    /* SSRs on PA4-6 -> Output, default low */
    PORTA.DIRSET = (PIN4_bm | PIN5_bm | PIN6_bm);
    PORTA.OUTCLR = (PIN4_bm | PIN5_bm | PIN6_bm);
    /* Signal relay (CP & PP) on PA3 -> Output, default low */
    PORTA.DIRSET = PIN3_bm;
    PORTA.OUTCLR = PIN3_bm;
    /* Lock drive A & B on PA7 and PC2 -> Output, default high, lock off */
    PORTA.DIRSET = LOCK_R;
    PORTA.OUTSET = LOCK_R;
    PORTC.DIRSET = LOCK_W;
    PORTC.OUTSET = LOCK_W;
    /* Lock state on PD2 -> Input */
    PORTD.DIRCLR = PIN2_bm;
    PORTD.PIN2CTRL |= PORT_ISC_INTDISABLE_gc;
    /* Current transformers input 0, 1, 2 -> input */
    PORTD.DIRCLR = (PIN5_bm | PIN6_bm | PIN7_bm); 

    /* PWM init (using TCA, Dual Slope PWM) */
    /* Set Output Port to PORTA */
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTA_gc;
    /* Set PA2 to output, default: high */
    PORTA.DIRSET = PIN2_bm;
    PORTA.OUTSET = PIN2_bm;                                
    /* Setup TCA Clock and enable it */                                
    TCA0.SINGLE.CTRLA |= (TCA_PRESCALER_BM | TCA_SINGLE_ENABLE_bm);
    /* Set to dual slope PWM */
    TCA0.SINGLE.CTRLB |= TCA_SINGLE_WGMODE_DSBOTTOM_gc;
    /* Set timer to count clock ticks */
    TCA0.SINGLE.EVCTRL &= ~(TCA_SINGLE_CNTEI_bm);
    /* Setup TCA period for desired FREQUENCY */
    TCA0.SINGLE.PERBUF = PWM_PERIOD(PWM_FREQ);
    /* Setup duty cycle */
    TCA0.SINGLE.CMP2BUF = (uint16_t)((1.0/100) * duty_cycle * PWM_PERIOD(PWM_FREQ));
    duty_cycle_old = duty_cycle;
    /* Disable PWM output by default */
    TCA0.SINGLE.CTRLB &= ~TCA_SINGLE_CMP2EN_bm;
    
    /* ADC init */
    /* Set ADC prescaler to 4 and reference to VDD */
    ADC0.CTRLC |= (ADC_PRESC_DIV4_gc | ADC_REFSEL_VDDREF_gc);
    /* Set ADC Resolution to 10bit and enable ADC */
    ADC0.CTRLA |= (ADC_RESSEL_10BIT_gc | ADC_ENABLE_bm);
    
    
     
    /* uart init */
    #ifdef ATMEVSE_UART
        uart_init();
    #endif
}

int8_t led_toggle() {
    PORTD.OUTTGL = PIN3_bm;
    return 0;
}

int8_t led_on() {
    PORTD.OUTSET = PIN3_bm;
    return 0;
}

int8_t led_off() {
    PORTD.OUTCLR = PIN3_bm;
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
    PORTA.OUTSET = PIN6_bm;
    return 0;
}

int8_t ssr1_off() {
    PORTA.OUTCLR = PIN6_bm;
    return 0;
}

int8_t ssr2_on() {
    PORTA.OUTSET = PIN5_bm;
    return 0;
}

int8_t ssr2_off() {
    PORTA.OUTCLR = PIN5_bm;
    return 0;   
}

int8_t ssr3_on() {
    PORTA.OUTSET = PIN4_bm;
    return 0;    
}

int8_t ssr3_off() {
    PORTA.OUTCLR = PIN4_bm;
    return 0;    
}

int8_t lock() {
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

int8_t unlock() {
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
    PORTA.OUTSET = PIN3_bm;
    return 0;
}

int8_t relay_off() {
    PORTA.OUTCLR = PIN3_bm;
    return 0;
}

uint16_t readCP() {
    ADC0.MUXPOS = ADC_MUXPOS_AIN1_gc;   
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    uint16_t adcVal = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    return adcVal;
}

uint16_t readPP() {
    ADC0.MUXPOS = ADC_MUXPOS_AIN0_gc;  
    ADC0.COMMAND = ADC_STCONV_bm;
    while (!(ADC0.INTFLAGS & ADC_RESRDY_bm)) {
        ;
    }
    uint16_t adcVal = ADC0.RES;
    ADC0.INTFLAGS = ADC_RESRDY_bm;
    return adcVal;
}

/*
    Application
    *************************************************/
int main(void) {
    init();
    sei();
    printf("test\r\n");
    char *input;
    while (1) {
        input = uart0_readLine();
        cmd_parse(input);
        lockstate = (PORTD.IN & LOCK_B) ? 1 : 0;
        ;   
    }
}

