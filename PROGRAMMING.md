# Bootloader & Firmware Building instructions

This document describes the process of building and deploying the optiboot bootloader and the ATmega4808 firmware for the ATmevse project

## Requirements

### Linux (only tested in Debian 10, but instructions are easily adapted to other Debian-based distros)
For the self compiled toolchain, a script is provided, but only tested on debian 10
1. avr-binutils version 2.26.20160125+Atmel3.6.1-4 (debian stable package binutils-avr) OR self-compiled avr-binutils 2.34
2. avr-gcc version 5.4.0+Atmel3.6.1-2 (debian stable package gcc-avr) OR self-compiled avr-gcc 10.1.0 
3. avr-libc version 2.0.0+Atmel3.6.1-2 (debian stable package avr-libc) OR self-compiled avr-libc 3.0
4. avrdude version 6.3-20171130+svn1429-2 (debian stable package avrdude) OR self-compiled avrdude 6.3
5. Atmel Device Pack Atmel.ATmega_DFP.1.4.351.atpack (http://packs.download.atmel.com/) 

6. Arduino IDE for flashing the bootloader OR using avrdude (currently untested)
7. If the bootloader is already flashed, application code may be uploaded with avrdude using a serial-usb adapter 

### Windows:
1. Atmel Studio 7 or higher OR the Arduino IDE (Both include the necessary toolchain)
2. When using the Arduino IDE, the MegaCoreX board files are necessary to flash the ATmega4808 from the IDE (https://github.com/MCUdude/MegaCoreX)
3. Custom versions of the bootloader can be built via MinGW, but a working .hex file is supplied in the repository

## Firmware modification
- Modification of the Firmware is possible, the repository includes Atmel Studio project files and a makefile for use on Linux platforms


## Programming the AVR
- Bootloader programming is done via UPDI, which means a working UPDI programming adapter like the Atmel ICE or a solution like JTAG2UPDI (https://github.com/ElTangas/jtag2updi)
- Once the Bootloader is flashed, application code may be uploaded with avrdude using a serial-usb adapter 
- All necessary pins are exposed on the J4 4x2 pin header, namely RX0, TX0 and RESET. Connect RESET to the serial adapter's DTR or RTS pin via a 100nF cap so avrdude can reset the MCU


## AVRDUDE problems:
- failing to read back flash for verification
- possibly wrong start address (FUSE setting?)