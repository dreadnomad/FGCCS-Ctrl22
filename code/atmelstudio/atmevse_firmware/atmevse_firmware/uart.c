/*
 * uart.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * UART module
 */ 

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include "uart.h"
#include <avr/io.h>
#include <stdint-gcc.h>
#include <string.h>
#include <stdio.h>

/*
    Variable definitions
    *************************************************/
static FILE uart_stream = FDEV_SETUP_STREAM(uart0_printChar, NULL, _FDEV_SETUP_WRITE);      // setup user defined stream for printf()
static char buffer[MAX_LINE_LEN];

/*
    Function definitions
    *************************************************/
void uart_init() {
    USART0.BAUD = (uint16_t)USART0_BAUD_RATE(115200);   // set uart0 baud rate
    USART0.CTRLB |= (USART_TXEN_bm | USART_RXEN_bm);    // enable uart0 TX & RX
    PORTA.DIRSET |= PIN0_bm;                            // set uart0 TX (PA0) to output
    PORTA.DIRSET &= ~PIN1_bm;                           // set uart0 RX (PA1) to input
    stdout = &uart_stream;
}

static void uart0_sendChar(char c) {
    /* Send char c to TX0 pin */
    while (!(USART0.STATUS & USART_DREIF_bm)) {     // Check for completed transmission
        ;
    }
    USART0.TXDATAL = c;
}

int uart0_printChar(char c, FILE *stream) {         // Wrapper for uart0_sendChar() using printf()
    uart0_sendChar(c);
    return 0;
}

static uint8_t uart0_readChar() {
    while (!(USART0.STATUS & USART_RXCIF_bm)) {
        ;
    }
    return USART0.RXDATAL;
}

const char * uart0_readLine() {                             // Read a single line from uart0 rx
    uint8_t index = 0;
    char c;
      
    while (1) {
        c = uart0_readChar();
        if ((c != '\n') && (c != '\r')) {
            buffer[index++] = c;
            if (index > MAX_LINE_LEN) {
                snprintf(buffer, sizeof(buffer), "Input too long, maximum no. of chars allowed: %d", MAX_LINE_LEN);
                return buffer;
            }
        }        
        if (c == '\n') {
            buffer[index] = '\0';
            index = 0;
            return buffer;
        }
    }
}     

