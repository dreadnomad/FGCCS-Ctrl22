/*
 * atm4808_blink_test.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * blink test program for ATmega4808
 */ 
#define F_CPU 10000000UL
#define PERIOD_EXAMPLE_VALUE (0x0CB6)
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

/* PWM Frequency and period calculation according to app note TB3217 */
#define PWM_FREQ 1000
#define PWM_DUTY_CYCLE (float)0.5
#define TCA_PRESCALER 8
#define TCA_PRESCALER_BM TCA_SINGLE_CLKSEL_DIV8_gc                      // The prescaler division bitmask must be set according to TCA_PRESCALER
#define PWM_PERIOD(FREQ) (uint16_t)(F_CPU / (2 * TCA_PRESCALER * FREQ))

volatile uint8_t buttonstate = 0;
volatile uint8_t duty_cycle = 50;
volatile uint8_t duty_cycle_old;

void init(void) {
    CPU_CCP = CCP_IOREG_gc;
    CPUINT.CTRLA &= ~CPUINT_IVSEL_bm;
    CPU_CCP = CCP_IOREG_gc;
    CLKCTRL.MCLKCTRLB = (CLKCTRL_PDIV_2X_gc | CLKCTRL_PEN_bm);          // set prescaler to 2 and enable it
    while (CLKCTRL.MCLKSTATUS & CLKCTRL_SOSC_bm) {                      // wait for clock to stabilize
        ;
    }
    
    PORTD.DIRSET = PIN3_bm;
    PORTD.DIRCLR = PIN4_bm;
    PORTD.PIN4CTRL |= PORT_ISC_FALLING_gc;
    
    /* PWM init (using TCA, Dual Slope PWM) */
    /* Set Output Port to PORTA */
    PORTMUX.TCAROUTEA = PORTMUX_TCA0_PORTA_gc;
    /* Set PA2 to output */
    PORTA.DIR |= PIN2_bm;                                
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
    TCA0.SINGLE.CTRLB |= TCA_SINGLE_CMP2EN_bm;
    
}

ISR(PORTD_PORT_vect) {
//     if (PORTD.OUT & PIN3_bm) {
//         PORTD.OUTCLR = PIN3_bm;
//     }
//     else {
//         PORTD.OUTSET = PIN3_bm;
//     }
    PORTD.INTFLAGS = PORT_INT4_bm;
}

// ISR(TCB0_INT_vect) {
//     buttonstate = ~buttonstate;
//     TCB0.INTFLAGS |= TCB_CAPT_bm; 
// }

int main(void) {
    init();
    sei();
    while (1) {
        if (PORTD.IN & PIN4_bm) {
            PORTD.OUTSET = PIN3_bm;
        }
        else {
            PORTD.OUTCLR = PIN3_bm;
        }
        ;
    }
    return 0;
}