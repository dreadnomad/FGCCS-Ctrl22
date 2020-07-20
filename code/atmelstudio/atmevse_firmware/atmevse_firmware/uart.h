/*
 * uart.h
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * UART module
 * Header file
 */ 

#ifndef ATMEVSE_UART
#define ATMEVSE_UART

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include <stdio.h>

/*
    Defines
    *************************************************/
#define USART0_BAUD_RATE(BAUD_RATE) ((float)(F_CPU * 64 / (16 * (float)BAUD_RATE)) + 0.5)
#define MAX_LINE_LEN 128                                                                    // Maximum number of chars on cmd line input

/*
    Function prototypes
    *************************************************/
void uart_init();
int uart0_printChar(char c, FILE *stream);
char * uart0_readLine();

#endif