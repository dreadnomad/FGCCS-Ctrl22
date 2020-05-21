/*
 * atm4808_uart_test.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * UART test program for ATmega4808
 * based on AppNote TB3216 - Getting Started with USART
 */ 

#define F_CPU 10000000UL
#define USART0_BAUD_RATE(BAUD_RATE) ((float)(F_CPU * 64 / (16 * (float)BAUD_RATE)) + 0.5)		// define Baud Rate according to datasheet formula

#include <avr/io.h>
#include <util/delay.h>
#include <stdint-gcc.h>
#include <string.h>

void init(void);
void USART0_sendChar(char c);
void USART0_sendString(char *str);
void toggle_led();

void init(void){
    
	USART0.BAUD = (uint16_t)USART0_BAUD_RATE(9600);
	USART0.CTRLB |= USART_TXEN_bm;
    PORTA.DIR |= PIN0_bm;       // set PA0 (TX0) to output
    PORTA.DIR &= ~PIN1_bm;      // set PA1 (RX0) to input
    PORTA.DIR |= PIN6_bm;       // set PA6 (LED) to output
    PORTA.OUTSET |= PIN6_bm;    // set LED to off on init
}

void USART0_sendChar(char c){
	while (!(USART0.STATUS & USART_DREIF_bm)){
        ;
    }
    USART0.TXDATAL = c;
}

void USART0_sendString(char *str){
    toggle_led();
    for(size_t i = 0; i > strlen(str); i++){
        USART0_sendChar(str[i]);
    }
}

void toggle_led(){
    PORTA.OUTTGL |= PIN6_bm;
}

int main(void)
{
	init();
    
    while(1){
        USART0_sendString("Hello World!\r\n");
        _delay_ms(500);
    }
}

