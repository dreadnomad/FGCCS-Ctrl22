/*
 * atm4808_blink_test.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * blink test program for ATmega4808
 */ 
#include <avr/io.h>
#include <avr/interrupt.h>

void init(void) {
    PORTD.DIRSET = PIN3_bm;
    PORTD.DIRCLR = PIN4_bm;
    PORTD.PIN4CTRL &= ~PORT_ISC_gm;
    PORTD.PIN4CTRL = PORT_ISC_RISING_gc;
    PORTD.PIN4CTRL &= ~PORT_PULLUPEN_bm;
}

ISR(PORTD_PORT_vect) {
    PORTD.OUTTGL = PIN3_bm;
    PORTD.INTFLAGS = PORT_INT4_bm;
}

int main(void) {
    init();
    sei();
    PORTD.OUTSET = PIN3_bm;
    while (1) {
        ;
    }
    return 0;
}