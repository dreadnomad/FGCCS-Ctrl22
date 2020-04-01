# Reverse Engineering Notes

This document collects notes and thoughts on porting and adapting the SmartEVSE charge controller for my bachelor's thesis.  

## Requirements

1. Port the controller to an ATmega4808 or ATmega328
2. Support for selection of either 1-phase or 3-phase charging via two separate contactors
3. Addition of two reed relays to simulate unplugging/re-plugging the pilot lines
4. Integrated measurement of charge currents for load balancing
5. WiFi/Serial protocols for OTA firmware updates

## Analysis of the SmartEVSEv2 circuit

- Lx is connected through a 1.25A fuse to a solid state relay, which is controlled by the uC
- Lx also feeds the onboard monolithic 12V power supply
- Varistor M1 is connected in parallel to the system, in order to protect it against overvoltage
- The 12V supply rail connects to the following:
    - IC1: DC buck converter, which supplies the uC with 3.3V
    - IC5: RS485 transceiver for serial interfacing with OpenSensorBox hardware
    - IC7: Voltage inverter, which supplies the opamp IC2 with a symmetric +/-12V
    - IC6: Actuator Driver controlling the socket locking mechanism
- IC4 (the uC) and IC3 (temp sensor) are supplied with 3.3V
- Provision for FTDI USB/UART serial connection -> used for programming the firmware
- Provision for ICD (in-circuit-debugger) -> PIC-specific protocol

### uC Pin Configuration

|No.    |Pin    |Function    |Used For         |
|:-----:|:-----:|:----------:|:---------------:|
|20     |VDD    |Power Supply|3.3V             |
|1      |MCLR   |Master Clear|External Reset   |
|2      |RA0    |            |                 |
|3      |RA1    |            |                 |
|4      |RA2    |            |                 |
|5      |RA3    |            |                 |
|6      |RA4    |            |                 |
|7      |RA5    |            |                 |
|10     |RA6    |            |                 | 
|9      |RA7    |OSC1 CLKI   |Q1 Input         |
|8; 19  |VSS    |GND         |GND              |
|18     |RC7    |RX1         |RS485 Receive    |
|17     |RC6    |TX1         |RS485 Transmit   |
|16     |RC5    |            |                 |
|15     |RC4    |            |                 | 
|14     |RC3    |            |                 |
|13     |RC2    |            |                 |
|12     |RC1    |            |                 |
|11     |RC0    |            |                 |
|28     |RB7    |RX2         |FTDI/ICD Receive |
|27     |RB6    |TX2         |FTDI/ICD Transmit|
|26     |RB5    |Digital I/O |RS485 Drv Enable |
|25     |RB4    |Digital I/O |SSR Activation   |
|24     |RB3    |Digital I/O |12V LED Switch   |
|23     |RB2    |Digital I/O |                 |
|22     |RB1    |Digital I/O |                 |
|21     |RB0    |Digital I/O |                 |

