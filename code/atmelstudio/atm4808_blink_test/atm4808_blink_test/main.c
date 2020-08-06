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
// #define PWM_FREQ 1000
// #define PWM_DUTY_CYCLE (float)0.5
// #define TCA_PRESCALER 8
// #define TCA_PRESCALER_BM TCA_SINGLE_CLKSEL_DIV8_gc                      // The prescaler division bitmask must be set according to TCA_PRESCALER
// #define PWM_PERIOD(FREQ) (uint16_t)(F_CPU / (2 * TCA_PRESCALER * FREQ))

volatile uint8_t buttonstate = 0;
volatile uint8_t duty_cycle = 50;

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
    PORTD.PIN4CTRL &= ~PORT_ISC_gm;
    PORTD.PIN4CTRL = PORT_ISC_RISING_gc;
    PORTD.PIN4CTRL &= ~PORT_PULLUPEN_bm;
    
    /* RTC setup */
    while (RTC.STATUS > 0) {
        ; /* Wait for all register to be synchronized */    
    }
    RTC.CLKSEL = RTC_CLKSEL_INT1K_gc;
    RTC.PITINTCTRL |= RTC_PI_bm;
    RTC.PITCTRLA = (RTC_PERIOD_CYC1024_gc | RTC_PITEN_bm);
    
}

ISR(RTC_PIT_vect) {
    RTC.PITINTFLAGS = RTC_PI_bm;
    PORTD.OUTTGL = PIN3_bm;
}

ISR(PORTD_PORT_vect) {
    PORTD.OUTTGL = PIN3_bm;
    PORTD.INTFLAGS = PORT_INT4_bm;
}

int main(void) {
    init();
    sei();
    while (1) {
        buttonstate = (PORTD.IN & PIN4_bm) ? 1 : 0;
        ;
    }
    return 0;
}