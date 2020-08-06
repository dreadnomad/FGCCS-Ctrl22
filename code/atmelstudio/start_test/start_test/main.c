#include <atmel_start.h>

volatile uint8_t test = 0;

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	/* Replace with your application code */
	while (1) {
        test++;
	}
}
