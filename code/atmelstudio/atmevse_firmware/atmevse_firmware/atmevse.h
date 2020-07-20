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

#ifndef ATMEVSE
#define ATMEVSE

/*
    Defines
    *************************************************/
#define F_CPU 3333333UL

/*
    Function prototypes
    *************************************************/
void led_toggle();
void led_on();
void led_off();

#endif