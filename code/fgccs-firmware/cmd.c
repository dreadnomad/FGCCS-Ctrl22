/*
 * cmd.c
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * FGCCS-Ctrl22 firmware for EV supply equipment
 * Command interpreter module
 */ 

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
#include "main.h"
#include "uart.h"
#include "cmd.h"
#include <stdint-gcc.h>
#include <string.h>
#include <stdlib.h>
#include <avr/interrupt.h>

/*
    Variables
    *************************************************/
extern cmd_table_t cmd_table[NO_CMD];
extern param_table_t param_table[NO_PARAM];

/*
    Static function declarations
    *************************************************/

/*
    Function definitions
    *************************************************/

int8_t cmd_exec(uint8_t index) {
    int8_t retval = -2;                                 // set inital return value to -2 -> general failure
    /* Find and execute command from cmd table */
    if (cmd_table[index].cmd_func_ptr != NULL) {       
        retval = cmd_table[index].cmd_func_ptr();
    }
    return retval;
}

int8_t cmd_parse(char *string) {
    int8_t retval = -1;                                 // set initial return value to -1 -> no valid command
    char *command = string;
    char *param = NULL;
    uint8_t is_param_op = 0;
    if (strcmp((const char *)string, "??") == 0) {
        command = "status";
    }
    /* Command is GET ("<param>?")*/
    else if (strchr(string, CMD_GET) != NULL) {                                         
        command = "param_get";                      
        param = strtok(string, "?");
        is_param_op = 1;
        uint32_t param_val = 0;
        retval = param_get(param, &param_val);
        if (retval == 0) {
            printf("%s = %"PRIu32"\r\n", param, param_val);               
        }        
    } 
    /* Command is SET ("<param>=<new_value>") */
    else if (strchr(string, CMD_SET) != NULL) {
        command = "param_set";
        is_param_op = 1;
        param = strtok(string, "=");
        char *str_value = strtok(NULL, "=");
        uint32_t value = (uint32_t)strtoul(str_value, NULL, 0);
        retval = param_set(param, &value);
        if (retval == 0) {
            uint32_t param_val = 0;
            param_get(param, &param_val);        
            printf("%s = %"PRIu32"\r\n", param, param_val);
        }
    }
    if (is_param_op == 0) {        
	    for (uint8_t i = 0; i < NO_CMD; i++) {
            if (strcmp(command, cmd_table[i].cmd) == 0) {
                retval = cmd_exec(i);
                i = NO_CMD;                             // exit loop
            }
	    } 
    }
    
    switch (retval) {                                   // select appropriate feedback to return
    case -1:
        printf("FAIL. Command %s not found in command table!\r\n", command);
    	return retval;
    case -2:
        printf("FAIL. Failed to execute command %s!\r\n", command);
        return retval;
    case -3:
        printf("FAIL. Invalid options/parameters for command %s!\r\n", command);
        return retval;
    case -4:
        printf("FAIL. Parameter %s not found in parameter table!\r\n", param);
        return retval;
    case 0:
        printf("OK.\r\n");
        return retval;
    }
    return retval;
}

int8_t param_get(char *param_string, uint32_t *param_value) {
    int8_t retval = -4;                                         // default return value -4 -> parameter not found
    for (uint8_t i = 0; i < NO_PARAM; i++) {
        if (strcmp((const char *)param_string, (const char *)param_table[i].param) == 0) {
            cli();
            switch (param_table[i].size) {                      // cast pointer to the correct data type according to param table size info
            case 8:
                *param_value = *(uint8_t *)param_table[i].value;
            	break;
            case 16:
                *param_value = *(uint16_t *)param_table[i].value;
                break;
            case 32:
                *param_value = *(uint32_t *)param_table[i].value;
                break;               
            }
            sei();
            i = NO_PARAM;                                   // exit loop
            retval = 0;
        }
    }
    return retval;
}

int8_t param_set(char *param_string, void *param_new_val_ptr) {
    int8_t retval = -4;                                                     // default return value -2 -> parameter not found
    for (uint8_t i = 0; i < NO_PARAM; i++) {
        if (strcmp(param_string, param_table[i].param) == 0) {
            cli();
            switch (param_table[i].size) {                                           // cast pointer to the correct data type according to param table size info
            case 8:
                *(uint8_t *)param_table[i].value = *(uint8_t *)param_new_val_ptr;
                retval = 0;
            	break;
            case 16:
                *(uint16_t *)param_table[i].value = *(uint16_t *)param_new_val_ptr;
                retval = 0;
                break;
            case 32:
                *(uint32_t *)param_table[i].value = *(uint32_t *)param_new_val_ptr;
                retval = 0;
                break; 
            default:
                retval = -3;                                                // default return value -3 -> invalid value size               
            }
            sei();
            i = NO_PARAM;                                               // exit loop
        }
    }
    return retval;
}

int8_t sys_status() {
    printf("$ Available commands:\r\n");                      // print all defined commands in cmd table
    for (uint8_t i = 0; i < NO_CMD; i++) {
        const char* cmd = (const char*)cmd_table[i].cmd;
        if (strcmp(cmd, "\0") != 0) {
            printf("$ %s\r\n", cmd);
        }
    }
    printf("$ Defined parameters:\r\n");                      // print all defined parameters in param table
    for (uint8_t i = 0; i < NO_PARAM; i++) {
        uint32_t param_value = 0;
        if (strcmp((const char *)param_table[i].param, "\0") != 0) {
            param_get(param_table[i].param, &param_value);
            printf("$ %d: %s = %"PRIu32"\r\n", i, param_table[i].param, param_value);
        }

    }
    printf("$ Status message end #\r\n");
    return 0;
}
