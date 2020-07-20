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
        cmd_table[cnt].cmd_func_ptr() = NULL;
    }
}

int8_t cmd_add(char *cmd_string, void (*cmd_func_ptr)()) {
    static uint8_t cmd_cnt = 0; // Keep track of registered commands
    int8_t retval = -1;         // ERROR: Return value == -1 -> cmd_table is full
    
    if (cmd_cnt < MAX_CMD_NO) {
        cmd_table[cmd_cnt].cmd = cmd_string;            // add command to table
        cmd_table[cmd_cnt].cmd_func_ptr = cmd_func_ptr;
        cmd_cnt++;                                      // increment command counter
        retval = 0;                                     // set retval to 0 -> success
    }
    
    return retval;    
}

int8_t cmd_exec(char *string) {
    
}
