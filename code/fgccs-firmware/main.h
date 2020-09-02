/*
 * main.h
 *
 * Created: 18.05.2020 11:51:17
 * Author : Pascal Thurnherr
 * 
 * FGCCS-Ctrl22 firmware for EV supply equipment
 * Core module
 * Header file
 * 
 * This work builds on the SmartEVSE project. All parts of this software that contain code from the 
 * original SmartEVSE sources is released as required with the copyright notice below.
 * 
 *   (C) 2013-2016  Michael Stegen / Stegen Electronics
 *
 *Permission is hereby granted, free of charge, to any person obtaining a copy
 *of this software and associated documentation files (the "Software"), to deal
 *in the Software without restriction, including without limitation the rights
 *to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *copies of the Software, and to permit persons to whom the Software is
 *furnished to do so, subject to the following conditions:
 *
 *The above copyright notice and this permission notice shall be included in
 *all copies or substantial portions of the Software.
 *
 *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *THE SOFTWARE.
 * 
 * 
 */ 
 */ 

/*
    Includes
    *************************************************/
#include <stdint-gcc.h>

#ifndef MAIN_H
#define MAIN_H
/*
    Defines
    *************************************************/
/* Testing / Production config */
#define DEBUG_P                     // Debug print enable/disable
#define TESTING                     // Run the testing main loop
//#define PRODUCTION                  // Run the production main loop

/* Config switches */
#define UART_SEL 0                 // Select main UART channel (0: UART0, 1: UART1/RS485)                                                                      // Select main uart (0: uart0, 1: uart1 (rs485), 2: uart2
#define ICAL 100                    // I_rms calibration value * 100 for current transformers
#define MAX_MAINS 32                // Max current [A] per phase the Mains connection can supply
#define MAX_CURRENT 32              // Max current [A] the EV will accept
#define MIN_CURRENT 6               // Min current [A] the EV will accept
#define NO_PHASE 3                  // Number of connected Mains phases
#define MODE MODE_NORMAL            // EVSE mode
#define MODE_NORMAL 0               // Normal mode (standalone operation)
#define MODE_MESH 1                 // Mesh mode (network of EVSE stations connected via WiFi)
#define CABLE_CONF 0                // Cable config: 0: Type 2 Socket, 1: Fixed Cable
#define LOCK_MODE 0                 // Lock config: 0: No lock, 1: Solenoid Lock
#define SWITCH 1                    // Switch config: 0: Charge on cable plugin, 1: Charge start/stop via Button
#define CHARGEDELAY 60              // Seconds to wait after overcurrent before trying again
#define TIMEOUT 1000                // Milliseconds until reset if no input from ESP/Server
#define MAX_TEMP 340                // Maximum safe operating temperature in K (340 K = 67 C)
#define MAX_LOCK_ATTEMPTS 3         // Maximum locking attempts before giving up
#define MAX_UNLOCK_ATTEMPTS 3       // Maximum unlocking attempts before giving up

/* States */
#define STATE_A 1                   // No vehicle connected
#define STATE_B 2                   // Vehicle connected, not ready for charging
#define STATE_C 3                   // Vehicle connected, ready for charging

/* Errors */
#define NO_ERROR 0                  // All OK
#define LESS_MIN_CURRENT 1          // Less than MIN_CURRENT available
#define NO_CURRENT 2                // No current
#define TEMP_HIGH 4                 // Temperature too high
#define NO_COMM 8                   // No communication with ESP/Server
#define LOCK_FAILED 16              // Cable locking failed
#define UNLOCK_FAILED 32            // Cable unlocking failed

/* Pilot levels */
#define PILOT_NOK 0
#define PILOT_12V 1
#define PILOT_9V 2
#define PILOT_6V 3
#define PILOT_DIODE 4

/* Debug printing */
#ifdef DEBUG_P
#define DEBUG_PRINT(x) printf(x)    // Use DEBUG_PRINT for debugging messages in code
#else
#define DEBUG_PRINT(x)
#endif

/* Maximum number of chars on cmd line input */
#define MAX_LINE_LEN 64

/* No. of samples for CT measurement */
#define SAMPLES 512

/* CPU Frequency, used for baud rate calculation */
#define F_CPU 10000000UL
/* PWM Frequency and period calculation according to app note TB3217 */
#define PWM_FREQ 1000
#define PWM_DUTY_CYCLE (float)0.5
#define TCA_PRESCALER 8
#define TCA_PRESCALER_BM TCA_SINGLE_CLKSEL_DIV8_gc                      // The prescaler division bitmask must be set according to TCA_PRESCALER
#define PWM_PERIOD(FREQ) (uint16_t)(F_CPU / (2 * TCA_PRESCALER * FREQ))
/* Define register shortcuts for TCA counter */
/*#define PWM_COUNT TCA0.SINGLE.CNT*/
// #define PWM_PERIOD_REG TCA0.SINGLE.PERBUF
// #define PWM_HIGH_TOP (uint16_t)(PWM_PERIOD_REG * 0.05)
// #define PWM_HIGH_BOT 1
// #define PWM_LOW_TOP (uint16_t)(PWM_PERIOD_REG)
// #define PWM_LOW_BOT (uint16_t)(PWM_PERIOD_REG * 0.9)

/* cmd and param tables */
#define NO_PARAM 34             // number of parameters in param table
#define NO_CMD 28               // number of commands in cmd table

/* Define pin bitmasks */
#define LED PIN3_bm
#define BUTTON PIN4_bm
#define LOCK_W PIN2_bm
#define LOCK_R PIN7_bm
#define LOCK_B PIN2_bm
#define SSR1 PIN6_bm
#define SSR2 PIN5_bm
#define SSR3 PIN4_bm
#define RELAY PIN3_bm
#define CT0 PIN5_bm
#define CT0_AIN ADC_MUXPOS_AIN5_gc
#define CT1 PIN6_bm
#define CT1_AIN ADC_MUXPOS_AIN6_gc
#define CT2 PIN7_bm
#define CT2_AIN ADC_MUXPOS_AIN7_gc
#define CP PIN1_bm
#define CP_AIN ADC_MUXPOS_AIN1_gc 
#define PP PIN0_bm
#define PP_AIN ADC_MUXPOS_AIN0_gc
#define PWM_OUT PIN2_bm


/*
    Typedefs
    *************************************************/

/*
    Global declarations
    *************************************************/
/* parameters in param_table */
extern uint16_t ctVal[NO_PHASE];
extern uint16_t Irms[NO_PHASE];
extern uint16_t ppVal;
extern uint16_t cpVal;
extern uint8_t pilot;
extern uint16_t temperature;
extern uint8_t dutyCycle;
extern uint32_t systime;                // System time counter [ms] (overflow after ~49 days)
extern uint32_t sectime;                // time counter [s] (overflow after ~8000 years)
extern uint16_t auxTimer1, auxTimer2;   // auxiliary timers
extern uint8_t lockstate;
extern volatile uint8_t buttonstate;
extern uint16_t Ical;
extern uint8_t maxMains;
extern uint8_t maxCurrent;
extern uint8_t minCurrent;
extern uint8_t mode;
extern uint8_t lock;
extern uint8_t cableConf;
extern uint8_t switchMode;
extern uint8_t state;
extern uint8_t error;
extern uint8_t nextState;
extern uint8_t maxCapacity;             // Max current capability of the cable
extern uint16_t chargeCurrent;
extern uint16_t Imeasured;
extern uint16_t Isum;
extern uint8_t chargeDelay;
extern uint8_t access;                  // controls access to charging states

/* input string for UART */
extern char input[MAX_LINE_LEN];
extern uint8_t rxflag;
extern uint8_t idx;

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
int8_t all_ssr_on();
int8_t all_ssr_off();
int8_t lock_cable();
int8_t unlock_cable();
int8_t lock_off();
int8_t relay_on();
int8_t relay_off();
int8_t readCP();
int8_t readPP();
int8_t readCT();
int8_t measureCurrent();
int8_t readTemp();
int8_t pp_ohm();
int8_t cp_volt();

#endif
