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
#include <stdlib.h>

/*
    Variables
    *************************************************/
static volatile cmd_table_t cmd_table[MAX_CMD_NO];
static volatile param_table_t param_table[MAX_PARAM_NO];

/*
    Static function declarations
    *************************************************/

static int8_t param_get(char *param_string, uint32_t *param_value);
static int8_t param_set(char *param_string, void *param_new_val_ptr, uint8_t param_size);
static int8_t sys_echo(char *string);
static int8_t cmd_exec(uint8_t index);

/*
    Function definitions
    *************************************************/
void cmd_init() {                                       // Init command and parameter table
    /* initialize system commands */
    cmd_table[0].cmd = "echo";
    cmd_table[0].cmd_func_ptr = *sys_echo;
    cmd_table[1].cmd = "status";
    cmd_table[1].cmd_func_ptr = *sys_status;
    cmd_table[2].cmd = "param_get";
    cmd_table[2].cmd_func_ptr = *param_get;
    cmd_table[3].cmd = "param_set";
    cmd_table[3].cmd_func_ptr = *param_set;
    
    for (uint8_t cnt = NO_SYS_CMD; cnt < MAX_CMD_NO; cnt++) {   // fill up cmd table with empty placeholders
        cmd_table[cnt].cmd = "\0";
        cmd_table[cnt].cmd_func_ptr = NULL;
    }
    for (uint8_t cnt = 0; cnt < MAX_PARAM_NO; cnt++) {
        param_table[cnt].param = "\0";
        param_table[cnt].value = NULL;
        param_table[cnt].size = 0;
    }
}

int8_t cmd_add(char *cmd_string, int8_t (*cmd_func_ptr)()) {
    static uint8_t cmd_cnt = NO_SYS_CMD;                // Keep track of registered commands
    int8_t retval = -1;                                 // ERROR: Return value == -1 -> cmd_table is full
    if (cmd_cnt < MAX_CMD_NO) {
        cmd_table[cmd_cnt].cmd = cmd_string;            // add command to table
        cmd_table[cmd_cnt].cmd_func_ptr = cmd_func_ptr;
        cmd_cnt++;                                      // increment command counter
        retval = 0;                                     // set retval to 0 -> success
    }
    
    return retval;    
}

static int8_t cmd_exec(uint8_t index) {
    int8_t retval = -2;                                 // set inital return value to -2 -> general failure
    if (cmd_table[index].cmd_func_ptr != NULL) {
        retval = cmd_table[index].cmd_func_ptr();
    }
    return retval;
}

int8_t cmd_parse(char *string) {
    int8_t retval = -1;                                 // set inital return value to -1 -> no valid command
    char *command = string;
    char *set_ptr = strchr(string, 0x3d);
    char *get_ptr = strchr(string, 0x3f);
    uint8_t is_param_op = 0;
    
    if (get_ptr != NULL) {
        if (strcmp(string, "??") == 0) {                // "??" is alias for "status"
            command = "status";
        }
        else {                                          
            command = "param_get";                      
            char *param = strtok(string, "?");          // get param name
            is_param_op = 1;                            // skip standard cmd parse
            uint32_t param_val = 0;
            for (uint8_t i = 0; i < MAX_PARAM_NO; i++) {
                if (strcmp(param, param_table[i].param) == 0) {
                    param_get((char *)param, &param_val);               // get param value
                    printf("%s = %+"PRIu32"\r\n", param, param_val);    // return value to serial
                    i = MAX_PARAM_NO;                                   // exit loop
                    retval = 0;
                }
	        }
        }        
    } 
    else if (set_ptr != NULL) {
        command = "param_set";
        is_param_op = 1;
        char *param = strtok(string, "=");
        char *str_value = strtok(NULL, "=");
        for (uint8_t i = 0; i < MAX_PARAM_NO; i++) {
            if (strcmp(param, param_table[i].param) == 0) {
                uint8_t size = param_table[i].size;                         // get param size
                uint8_t value8;
                uint16_t value16;
                uint32_t value32;
                switch (size) {                                             // cast value to the correct data type according to param table size info
                case 8:
                    value8 = (uint8_t)strtoul(str_value, NULL, 0);
                    param_set(param, &value8, 8);
                    retval = 0;
            	    break;
                case 16:
                    value16 = (uint16_t)strtoul(str_value, NULL, 0);
                    param_set(param, &value16, 16);
                    retval = 0;
                    break;
                case 32:
                    value32 = (uint32_t)strtoul(str_value, NULL, 0);
                    param_set(param, &value32, 32);
                    retval = 0;
                    break;
                }                    
                i = MAX_PARAM_NO;                                   // exit loop
                retval = 0;
            }
	    }
    }
    if (is_param_op == 0) {
	    for (uint8_t i = 0; i < MAX_CMD_NO; i++) {
            if (strcmp(command, cmd_table[i].cmd) == 0) {
                retval = cmd_exec(i);
                i = MAX_CMD_NO;                             // exit loop
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
    case 0:
        printf("OK. Command %s executed successfully!\r\n", command);
        return retval;
    }
    return retval;
}

int8_t param_add(char *param_string, void *param_value_ptr, uint8_t size) {
    static uint8_t param_cnt = 0;
    int8_t retval = -1;                                     // ERROR: Return value == -1 -> cmd_table is full
    if (param_cnt < MAX_CMD_NO) {
        param_table[param_cnt].param = param_string;        // add parameter to table
        param_table[param_cnt].value = param_value_ptr;
        param_table[param_cnt].size = size;
        param_cnt++;                                        // increment parameter counter
        retval = 0;                                         // set retval to 0 -> success
    }
    
    return retval;
}

static int8_t param_get(char *param_string, uint32_t *param_value) {
    int8_t retval = -2;                                         // default return value -2 -> parameter not found
    for (uint8_t i = 0; i < MAX_PARAM_NO; i++) {
        if (strcmp(param_string, param_table[i].param) == 0) {
            cli();
            switch (param_table[i].size) {                      // cast pointer to the correct data type according to param table size info
            case 8:
                *param_value = *(uint8_t *)param_table[i].value;
                retval = 0;
            	break;
            case 16:
                *param_value = *(uint16_t *)param_table[i].value;
                retval = 0;
                break;
            case 32:
                *param_value = *(uint32_t *)param_table[i].value;
                retval = 0;
                break;               
            }
            sei();
            i = MAX_PARAM_NO;                                   // exit loop
            retval = 0;
        }
    }
    return retval;
}

static int8_t param_set(char *param_string, void *param_new_val_ptr, uint8_t param_size) {
    int8_t retval = -2;                                                     // default return value -2 -> parameter not found
    for (uint8_t i = 0; i < MAX_PARAM_NO; i++) {
        if (strcmp(param_string, param_table[i].param) == 0) {
            cli();
            switch (param_size) {                                           // cast pointer to the correct data type according to param table size info
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
            i = MAX_PARAM_NO;                                               // exit loop
        }
    }
    return retval;
}

static int8_t sys_echo(char *string) {
    printf("%s", string);
    return 0;
}

int8_t sys_status() {
    printf("Available commands:\r\n");                      // print all defined commands in cmd table
    for (uint8_t i = 0; i < MAX_CMD_NO; i++) {
        const char* cmd = (const char*)cmd_table[i].cmd;
        if (strcmp(cmd, "\0") != 0) {
            printf("%s\r\n", cmd);
        }
    }
    printf("Defined parameters:\r\n");                      // print all defined parameters in param table
    for (uint8_t i = 0; i < MAX_PARAM_NO; i++) {
        static uint32_t param_val = 0;
        const char* param = (const char*)param_table[i].param;
        if (strcmp(param, "\0") != 0) {
            param_get((char *)param, &param_val);
            printf("%s = %+"PRIu32"\r\n", param, param_val);
        }
    }
    return 0;
}