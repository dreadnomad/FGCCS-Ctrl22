/*
 * uart.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * UART module
 */ 

/* TODO:
 * - Switch to interrupt-based USART implementation
 */

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include "uart.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint-gcc.h>
#include <string.h>
#include <stdio.h>

/*
    Variable definitions
    *************************************************/
static FILE uart0_stream = FDEV_SETUP_STREAM(uart0_printChar, NULL, _FDEV_SETUP_WRITE);      // uart0: setup user defined stream for printf()
static FILE uart1_stream = FDEV_SETUP_STREAM(uart1_printChar, NULL, _FDEV_SETUP_WRITE);      // uart1: setup user defined stream for printf()
static char buffer[MAX_LINE_LEN];
static ringbuffer_t rxbuffer;

/*
    ISR definitions
    *************************************************/

/*
    Function definitions
    *************************************************/
void uart_init() {
    /* Setup stream for printf() */  
    #if USART_SEL == 0
        stdout = &uart0_stream;
    #elif USART_SEL == 1
        stdout = &uart1_stream;
    #endif
    
    /* USART0 Config (Main comms and debug interface) */
    /* Baud rate */
    USART0.BAUD = (uint16_t)USART_BAUD_RATE(BAUD0);
    /* Enable interrupts */
    USART0.CTRLA |= (USART_RXCIE_bm | USART_TXCIE_bm | USART_DREIE_bm);
    /* Enable TX & RX */
    USART0.CTRLB |= (USART_TXEN_bm | USART_RXEN_bm);
    /* Set TX(PA0) to output, RX(PA1) to input */
    PORTA.DIRSET = PIN0_bm;
    PORTA.DIRCLR = PIN1_bm;
                                               

    
    /* USART1 Config (RS485 interface) */
    /* Baud rate */
    USART1.BAUD = (uint16_t)USART_BAUD_RATE(BAUD1);
    /* Enable interrupts */
    USART1.CTRLA |= (USART_RXCIE_bm | USART_TXCIE_bm | USART_DREIE_bm | USART_RS485_EXT_gc); 
    /* Enable TX & RX */    
    USART1.CTRLB |= (USART_TXEN_bm | USART_RXEN_bm);   
    /* Set TX(PC0) and XDIR(PC3) to output, RX(PC1) to input. XDIR low ->  Receiver mode */                     
    PORTC.DIRSET = PIN0_bm;                                              
    PORTC.DIRCLR = PIN1_bm;                                                
    PORTC.DIRSET = PIN3_bm;                                                
    PORTC.OUTCLR = PIN3_bm;
    
    # ifdef ATMEVSE_UART2
    /* USART2 Config (Secondary comms, by default disabled) */
    /* Baud rate */
    USART2.BAUD = (uint16_t)USART_BAUD_RATE(BAUD2);
    /* Disable interrupts */
    USART2.CTRLA &= ~(USART_RXCIE_bm | USART_TXCIE_bm | USART_DREIE_bm);
    /* Disable TX & RX */
    USART2.CTRLB &= ~(USART_TXEN_bm | USART_RXEN_bm);
    /* Set TX(PF0) to output, RX(PF1) to input */
    PORTF.DIRSET = PIN0_bm;
    PORTF.DIRCLR = PIN1_bm;
    #endif
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

char * uart0_readLine() {                             // Read a single line from uart0 RX
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

static void uart1_sendChar(char c) {
    /* Set XDIR high -> transmit mode */
    PORTC.OUTSET = PIN3_bm;
    /* Send char c to TX1 pin */
    while (!(USART1.STATUS & USART_DREIF_bm)) {     // Check for completed transmission
        ;
    }
    USART1.TXDATAL = c;
    while (!(USART1.STATUS & USART_DREIF_bm)) {     // Check for completed transmission
        ;
    }
    /* Return to receiver mode */
    PORTC.OUTCLR = PIN3_bm;
}

int uart1_printChar(char c, FILE *stream) {         // Wrapper for uar1_sendChar() using printf()
    uart1_sendChar(c);
    return 0;
}

void uart1_sendString(char *str) {
    for (size_t i = 0; i < strlen(str); i++) {
        uart1_sendChar(str[i]);
    }
}

static uint8_t uart1_readChar() {
    while (!(USART1.STATUS & USART_RXCIF_bm)) {
        ;
    }
    return USART1.RXDATAL;
}

char * uart1_readLine() {                             // Read a single line from uart1 RX
    uint8_t index = 0;
    char c;
    
    while (1) {
        c = uart1_readChar();
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
