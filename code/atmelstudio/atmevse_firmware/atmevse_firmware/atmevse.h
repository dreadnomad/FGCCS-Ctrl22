/*
 * atmevse.h
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * Core module
 * Header file
 */ 

/*
    Includes
    *************************************************/
#include <stdint-gcc.h>
#include <avr/interrupt.h>

#ifndef ATMEVSE
#define ATMEVSE

/*
    Defines
    *************************************************/
#define F_CPU 3333333UL

/*
    Typedefs
    *************************************************/

/*
    Function prototypes
    *************************************************/
int8_t led_toggle();
int8_t led_on();
int8_t led_off();

#endif