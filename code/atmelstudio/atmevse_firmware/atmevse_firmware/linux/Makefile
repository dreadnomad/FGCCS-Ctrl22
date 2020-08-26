################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL := dash
RM := rm -rf

USER_OBJS :=

LIBS := 
PROJ := 

O_SRCS := 
C_SRCS := 
S_SRCS := 
S_UPPER_SRCS := 
OBJ_SRCS := 
ASM_SRCS := 
PREPROCESSING_SRCS := 
OBJS := 
OBJS_AS_ARGS := 
C_DEPS := 
C_DEPS_AS_ARGS := 
EXECUTABLES := 
OUTPUT_FILE_PATH :=
OUTPUT_FILE_PATH_AS_ARGS :=
AVR_APP_PATH :=$$$AVR_APP_PATH$$$
QUOTE := "
ADDITIONAL_DEPENDENCIES:=
OUTPUT_FILE_DEP:=
LIB_DEP:=
LINKER_SCRIPT_DEP:=

EXEC_PATH := /opt/local/avr-toolchain/bin/
GCC := avr-gcc
OBJCOPY := avr-objcopy
OBJDUMP := avr-objdump
SIZE := avr-size

INCLUDE_PATH := /opt/local/avr-toolchain/lib/gcc/avr/10.1.0/include
DEV_PATH := /opt/local/avr-toolchain/lib/gcc/avr/10.1.0

# Every subdirectory with source files must be described here
SUBDIRS := 


# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS +=  \
../atmevse.c \
../cmd.c \
../uart.c


PREPROCESSING_SRCS += 


ASM_SRCS += 


OBJS +=  \
atmevse.o \
cmd.o \
uart.o

OBJS_AS_ARGS +=  \
atmevse.o \
cmd.o \
uart.o

C_DEPS +=  \
atmevse.d \
cmd.d \
uart.d

C_DEPS_AS_ARGS +=  \
atmevse.d \
cmd.d \
uart.d

OUTPUT_FILE_PATH +=atmevse_firmware.elf

OUTPUT_FILE_PATH_AS_ARGS +=atmevse_firmware.elf

ADDITIONAL_DEPENDENCIES:=

OUTPUT_FILE_DEP:= ./makedep.mk

LIB_DEP+= 

LINKER_SCRIPT_DEP+= 


# AVR32/GNU C Compiler
./atmevse.o: .././atmevse.c
	@echo Building file: $<
	@echo Invoking: AVR/GNU C Compiler : 5.4.0
	$(EXEC_PATH)$(GCC)  -x c -funsigned-char -funsigned-bitfields -DDEBUG -DDEBUG  -I$(INCLUDE_PATH)  -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -g2 -Wall -Wextra -mmcu=atmega4808 -B $(DEV_PATH) -c -std=gnu11 -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"   -o "$@" "$<" 
	@echo Finished building: $<
	

./cmd.o: .././cmd.c
	@echo Building file: $<
	@echo Invoking: AVR/GNU C Compiler : 5.4.0
	$(EXEC_PATH)$(GCC)  -x c -funsigned-char -funsigned-bitfields -DDEBUG -DDEBUG  -I$(INCLUDE_PATH)  -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -g2 -Wall -Wextra -mmcu=atmega4808 -B $(DEV_PATH) -c -std=gnu11 -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"   -o "$@" "$<" 
	@echo Finished building: $<
	

./uart.o: .././uart.c
	@echo Building file: $<
	@echo Invoking: AVR/GNU C Compiler : 5.4.0
	$(EXEC_PATH)$(GCC)  -x c -funsigned-char -funsigned-bitfields -DDEBUG -DDEBUG  -I$(INCLUDE_PATH)  -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -g2 -Wall -Wextra -mmcu=atmega4808 -B $(DEV_PATH) -c -std=gnu11 -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"   -o "$@" "$<" 
	@echo Finished building: $<
	




# AVR32/GNU Preprocessing Assembler



# AVR32/GNU Assembler




ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: $(OUTPUT_FILE_PATH) $(ADDITIONAL_DEPENDENCIES)

$(OUTPUT_FILE_PATH): $(OBJS) $(USER_OBJS) $(OUTPUT_FILE_DEP) $(LIB_DEP) $(LINKER_SCRIPT_DEP)
	@echo Building target: $@
	@echo Invoking: AVR/GNU Linker : 5.4.0
	$(EXEC_PATH)$(GCC) -o$(OUTPUT_FILE_PATH_AS_ARGS) $(OBJS_AS_ARGS) $(USER_OBJS) $(LIBS) -Wl,-Map="atmevse_firmware.map" -Wl,--start-group -Wl,-lm  -Wl,--end-group -Wl,--gc-sections -Wl,-section-start=.text=0x200  -mmcu=atmega4808 -B $(DEV_PATH)  
	@echo Finished building target: $@
	$(EXEC_PATH)$(OBJCOPY) -O ihex -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures  "atmevse_firmware.elf" "atmevse_firmware.hex"
	$(EXEC_PATH)$(OBJCOPY) -j .eeprom  --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0  --no-change-warnings -O ihex "atmevse_firmware.elf" "atmevse_firmware.eep" || exit 0
	$(EXEC_PATH)$(OBJDUMP) -h -S "atmevse_firmware.elf" > "atmevse_firmware.lss"
	$(EXEC_PATH)$(OBJCOPY) -O srec -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures "atmevse_firmware.elf" "atmevse_firmware.srec"
	$(EXEC_PATH)$(SIZE) "atmevse_firmware.elf"
	
	





# Other Targets
clean:
	-$(RM) $(OBJS_AS_ARGS) $(EXECUTABLES)  
	-$(RM) $(C_DEPS_AS_ARGS)   
	rm -rf "atmevse_firmware.elf" "atmevse_firmware.a" "atmevse_firmware.hex" "atmevse_firmware.lss" "atmevse_firmware.eep" "atmevse_firmware.map" "atmevse_firmware.srec" "atmevse_firmware.usersignatures"
	
