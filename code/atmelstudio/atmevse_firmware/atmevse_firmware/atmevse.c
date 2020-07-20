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
#include <util/delay.h>
#include <stdint-gcc.h>
#include <stdio.h>

/*
    Function definitions
    *************************************************/
static void init() {
    /* System init */
    
    
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

int8_t led_toggle() {
    PORTA.OUTTGL |= PIN6_bm;
    return 0;
}

int8_t led_on() {
    PORTA.OUT &= ~PIN6_bm;
    return 0;
}

int8_t led_off() {
    PORTA.OUT |= PIN6_bm;
    return 0;
}

/*
    Application
    *************************************************/
int main(void) {
    init();
    uint8_t test8 = 16;
    uint16_t test16 = 4096;
    uint32_t test32 = 100512;
    cmd_add("led_on", *led_on);
    cmd_add("led_off", *led_off);
    cmd_add("led_toggle", *led_toggle);
    param_add("test8", &test8, 8);
    param_add("test16", &test16, 16);
    param_add("test32", &test32, 32);
    sys_status();
    led_off();
    while (1) {
        char* input = uart0_readLine();
        cmd_parse(input);
    }
}

