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

#ifndef ATMEVSE
#define ATMEVSE

/*
    Defines
    *************************************************/
/* CPU Frequency, used for baud rate calculation */
#define F_CPU 10000000UL
/* PWM Frequency and period calculation according to app note TB3217 */
#define PWM_FREQ 1000
#define PWM_DUTY_CYCLE (float)0.5
#define TCA_PRESCALER 8
#define TCA_PRESCALER_BM TCA_SINGLE_CLKSEL_DIV8_gc                      // The prescaler division bitmask must be set according to TCA_PRESCALER
#define PWM_PERIOD(FREQ) (uint16_t)(F_CPU / (2 * TCA_PRESCALER * FREQ))

/* cmd and param tables, update according to definitions in atmevse.c */
#define PARAM_NO 6             // number of parameters in param table
#define CMD_NO 19               // number of commands in cmd table

/* Select main uart channel */
#define USART_SEL 0                                                                         // Select main uart (0: uart0, 1: uart1 (rs485), 2: uart2

/* Define pin bitmasks for cable lock R, W, B */
#define LOCK_W PIN2_bm
#define LOCK_R PIN7_bm
#define LOCK_B PIN2_bm
#define BUTTON PIN4_bm

/*
    Typedefs
    *************************************************/

/*
    Global declarations
    *************************************************/

/*
    Function prototypes
    *************************************************/
int8_t led_toggle();
int8_t led_on();
int8_t led_off();
int8_t pwm_on();
int8_t pwm_off();
int8_t pwm_set_duty_cycle(uint8_t duty_cycle);
int8_t ssr1_on();
int8_t ssr1_off();
int8_t ssr2_on();
int8_t ssr2_off();
int8_t ssr3_on();
int8_t ssr3_off();
int8_t lock();
int8_t unlock();
int8_t lock_off();
int8_t relay_on();
int8_t relay_off();

#endif