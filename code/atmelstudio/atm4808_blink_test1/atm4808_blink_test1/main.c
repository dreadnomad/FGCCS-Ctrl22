/*
 * atm4808_blink_test1.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * blink test program for ATmega4808
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include <stdint-gcc.h>

#define F_CPU 20000000UL

int main(void)
{
	
	PORTA.DIRSET = 0x40;
	
    /* Replace with your application code */
    while (1) 
	{
		PORTA.OUTTGL = 0x40;
		_delay_ms(1000);
    }
}

