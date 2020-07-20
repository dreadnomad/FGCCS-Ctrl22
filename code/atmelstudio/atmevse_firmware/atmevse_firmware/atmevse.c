/*
 * atmevse.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * Core module
 */ 

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include "uart.h"
#include <avr/io.h>
#include <util/delay.h>
#include <stdint-gcc.h>
#include <stdio.h>

/*
    Function definitions
    *************************************************/
static void init() {
    /* control LED init */
    PORTA.DIRSET |= PIN6_bm;
    
    /* uart init */
    #ifdef ATMEVSE_UART
        uart_init();
    #endif
    
    /* cmd init */
    #ifdef ATMEVSE_CMD
        cmd_init();     
    #endif
}

void led_toggle() {
    PORTA.OUTTGL |= PIN6_bm;
}

void led_on() {
    PORTA.OUT &= ~PIN6_bm;
}

void led_off() {
    PORTA.OUT |= PIN6_bm;
}

/*
    Application
    *************************************************/
int main(void) {
    init();
    led_off();
    while (1) {
        led_on();
        const char* input = uart0_readLine();
        led_off();
        printf("%s\r\n", input);
        _delay_ms(500);
    }
}

