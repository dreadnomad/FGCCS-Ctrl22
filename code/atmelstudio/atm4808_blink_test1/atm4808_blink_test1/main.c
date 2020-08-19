#define PERIOD_EXAMPLE_VALUE (0x0CB6)
#include <avr/io.h>
#include <avr/interrupt.h>
/*Using default clock 3.33MHz */
void TCA0_init(void);
void PORT_init(void);
void TCA0_init(void)
{
    /* enable overflow interrupt */
    TCA0.SINGLE.INTCTRL = TCA_SINGLE_OVF_bm;
    /* set Normal mode */
    TCA0.SINGLE.CTRLB = TCA_SINGLE_WGMODE_NORMAL_gc;
    /* disable event counting */
    TCA0.SINGLE.EVCTRL &= ~(TCA_SINGLE_CNTEI_bm);
    /* set the period */
    TCA0.SINGLE.PER = PERIOD_EXAMPLE_VALUE;
    TCA0.SINGLE.CTRLA = TCA_SINGLE_CLKSEL_DIV256_gc /* set clock
    source (sys_clk/256) */
    | TCA_SINGLE_ENABLE_bm; /* start timer */
}
void PORT_init(void)
{
    /* set pin 0 of PORT A as output */
    PORTD.DIR |= PIN3_bm;
}
ISR(TCA0_OVF_vect)
{
    /* Toggle PIN 0 of PORT A */
    PORTD.OUTTGL = PIN3_bm;
    /* The interrupt flag has to be cleared manually */
    TCA0.SINGLE.INTFLAGS = TCA_SINGLE_OVF_bm;
}
int main(void)
{
    PORT_init();
    TCA0_init();
    /* enable global interrupts */
    sei();
    while (1)
    {
        ;
    }
}