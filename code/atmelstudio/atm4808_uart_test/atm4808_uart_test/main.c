#define F_CPU 3333333
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/sleep.h>
#include <util/atomic.h>

#define PC2_LOW !(PORTC.IN & PIN2_bm)
#define PC2_INTERRUPT PORTC.INTFLAGS & PIN2_bm
#define PC2_CLEAR_INTERRUPT_FLAG PORTC.INTFLAGS &= PIN2_bm

volatile uint8_t PC2Ioc;

ISR(PORTC_PORT_vect)
{
    if(PC2_INTERRUPT)
    {
        PC2Ioc = 1;
        PC2_CLEAR_INTERRUPT_FLAG;
    }
}

void LED_init(void)
{
    PORTC.DIR |= PIN3_bm;
    PORTC.OUT |= PIN3_bm;
}

void BUTTON_init(void)
{
    PORTC.DIR &= ~ PIN2_bm;
    PORTC.PIN2CTRL |= PORT_PULLUPEN_bm | PORT_ISC_BOTHEDGES_gc;
}

int main(void)
{  
    LED_init();
    BUTTON_init();

    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    sei();

    while (1)
    {
        //sleep_mode();
       
        
        if(PC2Ioc)
        {
            if(PC2_LOW)
            {
                PORTC.OUT &= ~PIN3_bm;
            }
            else
            {
                PORTC.OUT |= PIN3_bm;
            }
            
            PC2Ioc = 0;
        }
    }

   return 0;
}