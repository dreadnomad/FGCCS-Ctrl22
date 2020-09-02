/*
 * cmd.h
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * FGCCS-Ctrl22 firmware for EV supply equipment
 * Command interpreter module 
 * Header file
 */ 

#ifndef CMD_H
#define CMD_H

/*
    Includes
    *************************************************/
#include "main.h"
#include "uart.h"
#include <stdio.h>

/*
    Defines
    *************************************************/
#define CMD_GET 0x3F            // marker for get commands (?)
#define CMD_SET 0x3D            // marker for set commands (=)
#define CMD_SPLIT 0x20          // marker for options (space)
#define CMD_STATUS "??"         // alias for "status" command ("??")
#define CMD_MULTILINE_START 0x24// marker for multiline start ($)
#define CMD_MULTILINE_END 0x23  // marker for multiline end (#)


/*
    Typedefs
    *************************************************/
typedef struct {
    char *cmd;
    int8_t (*cmd_func_ptr)();
    } cmd_table_t;

typedef struct {
    char *param;        // parameter name
    void *value;        // pointer to the parameter value -> must be cast according to the size member before use
    uint8_t size;       // size of the referenced parameter: 8, 16, or 32
    } param_table_t;
/*
    Variables
    *************************************************/

/*
    Function prototypes
    *************************************************/
int8_t param_get(char *param_string, uint32_t *param_value);
int8_t param_set(char *param_string, void *param_new_val_ptr);
int8_t cmd_exec(uint8_t index);
int8_t cmd_parse(char *string);
int8_t sys_status();                                                                // display all available commands and parameters

#endif
