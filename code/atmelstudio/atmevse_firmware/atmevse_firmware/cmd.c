/*
 * cmd.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * Command interpreter module
 */ 

// TODO:
// - parse cmd for func or param get/set
// - implement param table

/* Notes on commands in cmd_table
 * - all commands must adhere to the following return value conventions:
 *      -> return -1: must not exist!!
 *      -> return -2: general failure
 *      -> return -3: invalid options/parameters
 *      -> return 0: successful execution
 */

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include "uart.h"
#include "cmd.h"
#include <stdint-gcc.h>
#include <string.h>

/*
    Variables
    *************************************************/
static volatile cmd_table_t cmd_table[MAX_CMD_NO];

/*
    Function definitions
    *************************************************/
void cmd_init() {                                       // Init command table
    for (uint8_t cnt = 0; cnt < MAX_CMD_NO; cnt++) {
        cmd_table[cnt].cmd = "\0";
        cmd_table[cnt].cmd_func_ptr = NULL;
    }
}

int8_t cmd_add(char *cmd_string, int8_t (*cmd_func_ptr)()) {
    static uint8_t cmd_cnt = 0;                         // Keep track of registered commands
    int8_t retval = -1;                                 // ERROR: Return value == -1 -> cmd_table is full
    if (cmd_cnt < MAX_CMD_NO) {
        cmd_table[cmd_cnt].cmd = cmd_string;            // add command to table
        cmd_table[cmd_cnt].cmd_func_ptr = cmd_func_ptr;
        cmd_cnt++;                                      // increment command counter
        retval = 0;                                     // set retval to 0 -> success
    }
    
    return retval;    
}

static int8_t cmd_exec(char *string, uint8_t index) {
    int8_t retval = -2;                                 // set inital return value to -2 -> general failure
    if (cmd_table[index].cmd_func_ptr != NULL) {
        retval = cmd_table[index].cmd_func_ptr();
    }
    return retval;
}

int8_t cmd_parse(char *string) {
    int8_t retval = -1;                                 // set inital return value to -1 -> no valid command
    for (uint8_t i = 0; i < MAX_CMD_NO; i++) {
        if (strcmp(string, cmd_table[i].cmd) == 0) {
            retval = cmd_exec(string, i);
            i = MAX_CMD_NO;                             // exit loop
        }
    } 
    switch (retval) {                                   // select appropriate feedback to return
    case -1:
        printf("FAIL. Command %s not found in command table!\r\n", string);
    	return retval;
    case -2:
        printf("FAIL. Failed to execute command %s!\r\n", string);
        return retval;
    case -3:
        printf("FAIL. Invalid options/parameters for command %s!\r\n", string);
        return retval;
    case 0:
        printf("OK. Command %s executed successfully!\r\n", string);
        return retval;
    }
    return retval;
}
