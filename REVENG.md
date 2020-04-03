# Reverse Engineering Notes

This document collects notes and thoughts on porting and adapting the SmartEVSE charge controller for my bachelor's thesis.  

## Requirements

1. Port the controller to an ATmega4808 or ATmega328
2. Support for selection of either 1-phase or 3-phase charging via two separate contactors
3. Addition of two reed relays to simulate unplugging/re-plugging the pilot lines
4. Integrated measurement of charge currents for load balancing
5. WiFi/Serial protocols for OTA firmware updates, using ESP32-WROOM-32 SoC
6. Remove LCD interface and reuse pins for WiFi SoC

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
- Connector CON1 is a 12-pin socket used for low voltage (V <= 12V) connections (Data, Control, Peripherals)
- Connector CON2 is a 6-pin screw terminal used for AC line voltage connections (Power, Contactors)
- Connector CON3 is a 10-pin flat cable socket used for LCD connection
- Connector FTDI is a 6-pin terminal for serial connection to host PC, used for firmware updates
- Connector ICD is a 6-pin terminal used for PIC debugging and programming
- Connector P1 is a 4-pin socket used for connecting an optional residual current monitor (RCM), which can also be connected to Pins 3, 4 and 7 of CON1

## Tables

### Connector Configuration

Notation: FUNC -> PIN means a net with function FUNC is connected to connector pins

|Connector|No.  |Function       |
|:-------:|:---:|:-------------:|
|FTDI     |1    |N.C.           |
|FTDI     |2    |TX -> RB6      |
|FTDI     |3    |RX -> RB7      |
|FTDI     |4    |N.C.           |
|FTDI     |5    |3.3V           |
|FTDI     |6    |GND            |

|Connector|No.  |Function       |
|:-------:|:---:|:-------------:|
|ICD      |1    |Reset -> MCLR  |
|ICD      |2    |3.3V           |
|ICD      |3    |GND            |
|ICD      |4    |RX -> RB7      |
|ICD      |5    |TX -> RB6      |
|ICD      |6    |N.C.           |

|Connector|No.  |Function       |
|:-------:|:---:|:-------------:|
|CON1     |1    |RS485_A        |
|CON1     |2    |RS485_B        |
|CON1     |3    |RS485_12V      |
|CON1     |4    |RS485_GND      |
|CON1     |5    |IO1 -> 12V LED |
|CON1     |6    |IO2 -> Button  |
|CON1     |7    |IO3 -> RCM     |
|CON1     |8    |Lock B         |
|CON1     |9    |Lock R         |
|CON1     |10   |Lock W         |
|CON1     |11   |EV PP          |
|CON1     |12   |EV CP          |

|Connector|No.  |Function       |
|:-------:|:---:|:-------------:|
|CON2     |1    |PE             |
|CON2     |2    |N.C.           |
|CON2     |3    |Contactor / L  |
|CON2     |4    |Contactor / N  |
|CON2     |5    |AC N           |
|CON2     |6    |AC L           |

|Connector|No.  |Function       |
|:-------:|:---:|:-------------:|
|CON3     |1    |N.C.           |
|CON3     |2    |LCD_LED        |
|CON3     |3    |LCD_B1         |
|CON3     |4    |LCD_CLK        |
|CON3     |5    |LCD_A0_B2      |
|CON3     |6    |LCD_RST        |
|CON3     |7    |LCD_SDO_B3     |
|CON3     |8    |GND            |
|CON3     |9    |N.C            |
|CON3     |10   |3.3V           |

|Connector|No.  |Function       |
|:-------:|:---:|:-------------:|
|P1       |1    |GND            |
|P1       |2    |12V            |
|P1       |3    |N.C.           |
|P1       |4    |IO3 -> RCM     |

### uC Pin Configuration

|No.    |Pin    |Function    |Used For         |
|:-----:|:-----:|:----------:|:---------------:|
|20     |VDD    |Power Supply|3.3V             |
|1      |MCLR   |Master Clear|External Reset   |
|2      |RA0    |            |                 |
|3      |RA1    |            |                 |
|4      |RA2    |Digital I/O |Temp sensor input|
|5      |RA3    |Digital I/O |LCD_LED          |
|6      |RA4    |Digital I/O |Lck Drv Inp A ->R|
|7      |RA5    |Digital I/O |Lck Drv Inp B ->W|
|10     |RA6    |OSC2 CLKO   |Q1 Driver        | 
|9      |RA7    |OSC1 CLKI   |Q1 Input         |
|8; 19  |VSS    |GND         |GND              |
|18     |RC7    |RX1         |RS485 Receive    |
|17     |RC6    |TX1         |RS485 Transmit   |
|16     |RC5    |Digital I/O |LCD_SDO_B3       |
|15     |RC4    |Digital I/O |LCD_RST          | 
|14     |RC3    |Digital I/O |LCD_CLK          |
|13     |RC2    |            |                 |
|12     |RC1    |Digital I/O |Lock Pin -> B    | 
|11     |RC0    |Digital I/O |LCD_A0_B2        |
|28     |RB7    |RX2         |FTDI/ICD Receive |
|27     |RB6    |TX2         |FTDI/ICD Transmit|
|26     |RB5    |Digital I/O |RS485 Drv Enable |
|25     |RB4    |Digital I/O |SSR Activation   |
|24     |RB3    |Digital I/O |IO1 -> 12V LED   |
|23     |RB2    |Digital I/O |IO2 -> Button(SW)|
|22     |RB1    |Digital I/O |IO3 -> RCM       |
|21     |RB0    |Digital I/O |LCD_B1           |
