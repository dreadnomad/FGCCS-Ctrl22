/*
 * cmd.h
 *
 * Created: 18.05.2020 11:51:17
 * Author : ko07xiqa
 * 
 * ATmevse firmware for EV supply equipment
 * Command interpreter module 
 * Header file
 */ 

#ifndef ATMEVSE_CMD
#define ATMEVSE_CMD

/*
    Includes
    *************************************************/
#include "atmevse.h"
#include "uart.h"
#include <stdio.h>

/*
    Defines
    *************************************************/
#define MAX_CMD_NO 20           // max number of commands in cmd table
#define MAX_CMD_LEN 48          // max length of command names
#define CMD_START 0x23          // marker for command start (hash, ASCII 0x23)
#define CMD_GET 0x3F            // marker for get commands (question mark, ASCII 0x3F)
#define CMD_SET 0x3D            // marker for set commands (equal sign, ASCII 0x3D)
#define CMD_END 0x0A            // marker for command end (\n, ASCII 0x0A)

/*
    Typedefs
    *************************************************/
typedef struct {
    char *cmd;
    int8_t (*cmd_func_ptr)();
    } cmd_table_t;

/*
    Variables
    *************************************************/

/*
    Function prototypes
    *************************************************/
void cmd_init();
int8_t cmd_add(char *cmd_string, int8_t (*cmd_func_ptr)());
int8_t cmd_parse(char *string);

#endif