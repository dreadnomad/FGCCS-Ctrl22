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

#ifndef ATMEVSE_UART_H
#define ATMEVSE_UART_H

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include <stdio.h>

/*
    Defines
    *************************************************/
#define USART_BAUD_RATE(BAUD_RATE) ((float)(F_CPU * 64 / (16 * (float)BAUD_RATE)) + 0.5)
#define BUFFER_SIZE 64                                                                      // Size of receiver ring buffer
/* Baud Rates for USARTn */
#define BAUD0 115200
#define BAUD1 9600
#define BAUD2 9600

/*
    Typedefs
    *************************************************/
typedef struct {
    uint8_t data[BUFFER_SIZE];  // array containing char data
    uint8_t read;               // points at oldest data
    uint8_t write;              // points at empty field after newest data
} ringbuffer_t;

/*
    Function prototypes
    *************************************************/
void uart_init();
int uart0_printChar(char c, FILE *stream);
void uart0_readLoop();
char * uart0_readLine();
int uart1_printChar(char c, FILE *stream);
void uart1_sendString(char *str);
char * uart1_readLine();

#endif