/*
 * atm4808_uart_test.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * UART test program for ATmega4808
 * based on AppNote TB3216 - Getting Started with USART
 */ 

#define F_CPU 1000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <stdint-gcc.h>
#include <string.h>

#define LED_MSK 0x40                                                                            // LED_MSK is alias for PIN6 bitmask
#define USART0_BAUD_RATE(BAUD_RATE) ((float)(F_CPU * 64 / (16 * (float)BAUD_RATE)) + 0.5)		// define Baud Rate according to datasheet formula

void init(void);
void USART0_sendChar(uint8_t c);
void USART0_sendString(uint8_t *str);
void led_on();
void led_off();
void led_toggle();


void init(void){
    CPU_CCP = CCP_IOREG_gc;     // Unlock config change protection
    CLKCTRL.MCLKCTRLB = CLKCTRL_PDIV_16X_gc | CLKCTRL_PEN_bm;
	USART0.BAUD = (uint16_t)USART0_BAUD_RATE(9600);
	USART0.CTRLB |= USART_TXEN_bm;
    USART0.CTRLB |= USART_RXEN_bm;
    PORTA.DIR |= PIN0_bm;       // set PA0 (TX0) to output
    PORTA.DIR &= ~PIN1_bm;      // set PA1 (RX0) to input
    PORTA.DIR |= LED_MSK;       // set PA6 (LED) to output
    PORTA.OUTSET |= LED_MSK;    // set LED to off on init
}

void USART0_sendChar(uint8_t c){
	while (!(USART0.STATUS & USART_DREIF_bm)){
        ;
    }
    USART0.TXDATAL = c;
}

void USART0_sendString(uint8_t *str){
    for(size_t i = 0; i < strlen(str); i++){
        USART0_sendChar(str[i]);
    }
}

uint8_t USART0_getChar(){
    while(!(USART0.STATUS & USART_RXCIF_bm)){       // wait for finished data reception
        ;
    }
    return USART0.RXDATAL;
}

void USART0_getString(char* buffer, uint8_t maxLen){
    uint8_t nextChar;
    uint8_t stringLen = 0;
    
    nextChar = USART0_getChar();    // wait for the next char
    
    while( (nextChar != '\n') && (stringLen < (maxLen - 1))) {
        *buffer++ = nextChar;
        stringLen++;
        nextChar = USART0_getChar();
    }
    
    *buffer = '\0';
}

uint8_t cmdParse(uint8_t *cmd){
    if (strcmp("led_on", cmd) == 0){
       return 1; 
    }
    if (strcmp("led_off", cmd) == 0){
        return 2;
    }
    else {
        return 0;
    }
}

void resetBuffer(char* buffer, uint8_t bufLen){
    *buffer = NULL;
    for (uint8_t i = 1; i < bufLen; i++) {
        *buffer++ = NULL;    
    }
}
void led_on(){
    PORTA.OUTSET |= LED_MSK;
}

void led_off(){
    PORTA.OUTCLR |= LED_MSK;
}

void led_toggle(){
    PORTA.OUTTGL |= LED_MSK;
}

int main(void)
{
	init();
    uint8_t cmd;
    uint8_t rxcmd[40];
    
    while(1){
        USART0_getString(rxcmd, sizeof(rxcmd));
        cmd = cmdParse(rxcmd);
        resetBuffer(rxcmd, sizeof(rxcmd));
        switch (cmd)
        {
        case 1:
            led_on();
            USART0_sendString("LED switched on!\r\n");
        	break;
        case 2:
            led_off();
            USART0_sendString("LED switched off!\r\n");
            break;
        default:
            USART0_sendString("Enter a valid command!\r\n");
        }        
    }
}

