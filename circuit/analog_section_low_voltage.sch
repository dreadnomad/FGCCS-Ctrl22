EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date "2020-05-18"
Rev "0.6"
Comp ""
Comment1 "DONE: CT inputs on J2"
Comment2 "TODO: Det. Q2, R14, R17, verify relay circuit"
Comment3 "TODO: verify CT bias voltage divider & CT circuit"
Comment4 "DONE: voltage divider & zener diode on button input"
$EndDescr
$Comp
L Connector:Screw_Terminal_01x20 J2
U 1 1 5E903CA7
P 8700 3100
F 0 "J2" H 8780 3092 50  0000 L CNN
F 1 "Screw_Terminal_01x20" H 8780 3001 50  0000 L CNN
F 2 "" H 8700 3100 50  0001 C CNN
F 3 "~" H 8700 3100 50  0001 C CNN
	1    8700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2200 8300 2200
Wire Wire Line
	8500 2300 8300 2300
Wire Wire Line
	8500 2400 8400 2400
Wire Wire Line
	8400 2400 8400 1950
$Comp
L Device:Polyfuse_Small F1
U 1 1 5E90649F
P 8400 1850
F 0 "F1" H 8468 1896 50  0000 L CNN
F 1 "FSMD020 " H 8468 1805 50  0000 L CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" H 8450 1650 50  0001 L CNN
F 3 "~" H 8400 1850 50  0001 C CNN
F 4 "ESKA FSMD020 PTC-Sicherung" H 8400 1850 50  0001 C CNN "Part"
F 5 "524900 " H 8400 1850 50  0001 C CNN "PartNo"
F 6 "Conrad" H 8400 1850 50  0001 C CNN "Supplier"
	1    8400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1750 8400 1150
$Comp
L Device:C_Small C20
U 1 1 5E906C0D
P 6200 1300
F 0 "C20" H 6292 1346 50  0000 L CNN
F 1 "100n" H 6292 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6200 1300 50  0001 C CNN
F 3 "~" H 6200 1300 50  0001 C CNN
F 4 "Kemet C0603C104K3RAC7867+ Keramik-Kondensator SMD 0603 100 nF 25 V 10 %" H 6200 1300 50  0001 C CNN "Part"
F 5 "1420339" H 6200 1300 50  0001 C CNN "PartNo"
F 6 "Conrad" H 6200 1300 50  0001 C CNN "Supplier"
	1    6200 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1150 6200 1200
$Comp
L power:GND #PWR0101
U 1 1 5E907420
P 6200 1400
F 0 "#PWR0101" H 6200 1150 50  0001 C CNN
F 1 "GND" H 6205 1227 50  0000 C CNN
F 2 "" H 6200 1400 50  0001 C CNN
F 3 "" H 6200 1400 50  0001 C CNN
	1    6200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1150 5700 1050
$Comp
L power:+12V #PWR0102
U 1 1 5E907B89
P 5700 1050
F 0 "#PWR0102" H 5700 900 50  0001 C CNN
F 1 "+12V" H 5715 1223 50  0000 C CNN
F 2 "" H 5700 1050 50  0001 C CNN
F 3 "" H 5700 1050 50  0001 C CNN
	1    5700 1050
	1    0    0    -1  
$EndComp
Connection ~ 6200 1150
$Comp
L Device:Opamp_Dual_Generic U11
U 1 1 5E9126F4
P 5600 1800
F 0 "U11" H 5600 1433 50  0000 C CNN
F 1 "LM7332" H 5600 1524 50  0000 C CNN
F 2 "" H 5600 1800 50  0001 C CNN
F 3 "~" H 5600 1800 50  0001 C CNN
	1    5600 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:Opamp_Dual_Generic U11
U 2 1 5E913218
P 5400 2850
F 0 "U11" H 5400 3217 50  0000 C CNN
F 1 "LM7332" H 5400 3126 50  0000 C CNN
F 2 "" H 5400 2850 50  0001 C CNN
F 3 "~" H 5400 2850 50  0001 C CNN
	2    5400 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:Opamp_Dual_Generic U12
U 3 1 5E913947
P 5800 1800
F 0 "U12" H 5758 1846 50  0000 L CNN
F 1 "LM7332_Power_Supply" H 5758 1755 50  0000 L CNN
F 2 "" H 5800 1800 50  0001 C CNN
F 3 "~" H 5800 1800 50  0001 C CNN
	3    5800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1500 5700 1150
Connection ~ 5700 1150
Wire Wire Line
	5700 1150 6200 1150
Wire Wire Line
	5900 1700 6000 1700
Wire Wire Line
	6000 1700 6000 1350
Wire Wire Line
	6000 1350 5300 1350
Wire Wire Line
	5300 1350 5300 1800
Wire Wire Line
	5700 2100 5700 2150
$Comp
L power:-12V #PWR0103
U 1 1 5E918461
P 5700 2200
F 0 "#PWR0103" H 5700 2300 50  0001 C CNN
F 1 "-12V" H 5715 2373 50  0000 C CNN
F 2 "" H 5700 2200 50  0001 C CNN
F 3 "" H 5700 2200 50  0001 C CNN
	1    5700 2200
	-1   0    0    1   
$EndComp
Connection ~ 5700 2150
Wire Wire Line
	5700 2150 5700 2200
$Comp
L Device:C_Small C18
U 1 1 5E918D93
P 6000 2250
F 0 "C18" H 6092 2296 50  0000 L CNN
F 1 "100n" H 6092 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6000 2250 50  0001 C CNN
F 3 "~" H 6000 2250 50  0001 C CNN
F 4 "Kemet C0603C104K3RAC7867+ Keramik-Kondensator SMD 0603 100 nF 25 V 10 %" H 6000 2250 50  0001 C CNN "Part"
F 5 "1420339" H 6000 2250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 6000 2250 50  0001 C CNN "Supplier"
	1    6000 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2150 6000 2150
$Comp
L power:GND #PWR0104
U 1 1 5E9197E3
P 6000 2350
F 0 "#PWR0104" H 6000 2100 50  0001 C CNN
F 1 "GND" H 6005 2177 50  0000 C CNN
F 2 "" H 6000 2350 50  0001 C CNN
F 3 "" H 6000 2350 50  0001 C CNN
	1    6000 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1900 6350 1900
$Comp
L Device:R_Small R23
U 1 1 5E91A28A
P 5950 2850
F 0 "R23" V 6146 2850 50  0000 C CNN
F 1 "1k 1%" V 6055 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5950 2850 50  0001 C CNN
F 3 "~" H 5950 2850 50  0001 C CNN
F 4 "TRU COMPONENTS TC-HP03W5F1001T5E203 Dickschicht-Widerstand 1 kΩ SMD 0603 0.2 W 1 % " H 5950 2850 50  0001 C CNN "Part"
F 5 "1585508 " H 5950 2850 50  0001 C CNN "PartNo"
F 6 "Conrad" H 5950 2850 50  0001 C CNN "Supplier"
	1    5950 2850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5850 2850 5700 2850
Wire Wire Line
	6050 2850 6150 2850
Wire Wire Line
	6350 1900 6350 2850
Wire Wire Line
	5100 2950 4650 2950
Wire Wire Line
	4650 2350 4650 2950
$Comp
L Device:R_Small R18
U 1 1 5E91B9F4
P 4650 2250
F 0 "R18" H 4709 2296 50  0000 L CNN
F 1 "15k" H 4709 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4650 2250 50  0001 C CNN
F 3 "~" H 4650 2250 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0153T5E203 Dickschicht-Widerstand 15 kΩ SMD 0603 0.1 W" H 4650 2250 50  0001 C CNN "Part"
F 5 "1585827 " H 4650 2250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 4650 2250 50  0001 C CNN "Supplier"
	1    4650 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R19
U 1 1 5E91BDD8
P 4650 3350
F 0 "R19" H 4709 3396 50  0000 L CNN
F 1 "15k" H 4709 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4650 3350 50  0001 C CNN
F 3 "~" H 4650 3350 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0153T5E203 Dickschicht-Widerstand 15 kΩ SMD 0603 0.1 W" H 4650 3350 50  0001 C CNN "Part"
F 5 "1585827 " H 4650 3350 50  0001 C CNN "PartNo"
F 6 "Conrad" H 4650 3350 50  0001 C CNN "Supplier"
	1    4650 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2950 4650 3250
Connection ~ 4650 2950
Wire Wire Line
	5100 2750 4950 2750
$Comp
L Device:R_Small R20
U 1 1 5E91C99B
P 4850 2750
F 0 "R20" V 4654 2750 50  0000 C CNN
F 1 "15k" V 4745 2750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4850 2750 50  0001 C CNN
F 3 "~" H 4850 2750 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0153T5E203 Dickschicht-Widerstand 15 kΩ SMD 0603 0.1 W" H 4850 2750 50  0001 C CNN "Part"
F 5 "1585827 " H 4850 2750 50  0001 C CNN "PartNo"
F 6 "Conrad" H 4850 2750 50  0001 C CNN "Supplier"
	1    4850 2750
	0    1    1    0   
$EndComp
Text HLabel 3850 2750 0    50   Input ~ 0
PWM_Out
Wire Wire Line
	4650 2150 4650 2050
$Comp
L power:+3.3V #PWR0105
U 1 1 5E91E5EE
P 4650 2050
F 0 "#PWR0105" H 4650 1900 50  0001 C CNN
F 1 "+3.3V" H 4665 2223 50  0000 C CNN
F 2 "" H 4650 2050 50  0001 C CNN
F 3 "" H 4650 2050 50  0001 C CNN
	1    4650 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R16
U 1 1 5E91EB9F
P 4250 3350
F 0 "R16" H 4309 3396 50  0000 L CNN
F 1 "15k" H 4309 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4250 3350 50  0001 C CNN
F 3 "~" H 4250 3350 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0153T5E203 Dickschicht-Widerstand 15 kΩ SMD 0603 0.1 W" H 4250 3350 50  0001 C CNN "Part"
F 5 "1585827 " H 4250 3350 50  0001 C CNN "PartNo"
F 6 "Conrad" H 4250 3350 50  0001 C CNN "Supplier"
	1    4250 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5E91EE28
P 4250 2250
F 0 "R15" H 4309 2296 50  0000 L CNN
F 1 "10k" H 4309 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4250 2250 50  0001 C CNN
F 3 "~" H 4250 2250 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAF1002T5E203 Dickschicht-Widerstand 10 kΩ SMD 0603 0.1 W 1 %" H 4250 2250 50  0001 C CNN "Part"
F 5 "1585269 " H 4250 2250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 4250 2250 50  0001 C CNN "Supplier"
	1    4250 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2350 4250 2450
Wire Wire Line
	4250 3450 4250 4500
Wire Wire Line
	4650 4500 4650 3450
$Comp
L power:GND #PWR0106
U 1 1 5E91FFF3
P 4250 4500
F 0 "#PWR0106" H 4250 4250 50  0001 C CNN
F 1 "GND" H 4255 4327 50  0000 C CNN
F 2 "" H 4250 4500 50  0001 C CNN
F 3 "" H 4250 4500 50  0001 C CNN
	1    4250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2450 3950 2450
Connection ~ 4250 2450
Wire Wire Line
	4250 2450 4250 3250
Text HLabel 3850 2450 0    50   Output ~ 0
CP
Wire Wire Line
	4250 2150 4250 2050
Wire Wire Line
	4250 2050 4650 2050
Connection ~ 4650 2050
Wire Wire Line
	5300 1800 3950 1800
Wire Wire Line
	3950 1800 3950 2150
Connection ~ 5300 1800
$Comp
L Device:R_Small R13
U 1 1 5E923E93
P 3950 2250
F 0 "R13" H 4009 2296 50  0000 L CNN
F 1 "40.2k" H 4009 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3950 2250 50  0001 C CNN
F 3 "~" H 3950 2250 50  0001 C CNN
F 4 "Panasonic ERJ-6ENF4022V Dickschicht-Widerstand 40.2 kΩ SMD 0805 0.125 W 1 %" H 3950 2250 50  0001 C CNN "Part"
F 5 "1480312 " H 3950 2250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 3950 2250 50  0001 C CNN "Supplier"
	1    3950 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2350 3950 2450
Connection ~ 3950 2450
Wire Wire Line
	3950 2450 3850 2450
Wire Wire Line
	3850 2750 4750 2750
Wire Wire Line
	3850 3650 4900 3650
$Comp
L Device:R_Small R21
U 1 1 5E933A1B
P 5200 3650
F 0 "R21" V 5004 3650 50  0000 C CNN
F 1 "10k" V 5095 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5200 3650 50  0001 C CNN
F 3 "~" H 5200 3650 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAF1002T5E203 Dickschicht-Widerstand 10 kΩ SMD 0603 0.1 W 1 %" H 5200 3650 50  0001 C CNN "Part"
F 5 "1585269 " H 5200 3650 50  0001 C CNN "PartNo"
F 6 "Conrad" H 5200 3650 50  0001 C CNN "Supplier"
	1    5200 3650
	0    1    1    0   
$EndComp
Connection ~ 4900 3650
Wire Wire Line
	4900 3650 5100 3650
$Comp
L Device:R_Small R22
U 1 1 5E943018
P 5600 3500
F 0 "R22" H 5541 3454 50  0000 R CNN
F 1 "1k 1%" H 5541 3545 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5600 3500 50  0001 C CNN
F 3 "~" H 5600 3500 50  0001 C CNN
F 4 "TRU COMPONENTS TC-HP03W5F1001T5E203 Dickschicht-Widerstand 1 kΩ SMD 0603 0.2 W 1 % " H 5600 3500 50  0001 C CNN "Part"
F 5 "1585508 " H 5600 3500 50  0001 C CNN "PartNo"
F 6 "Conrad" H 5600 3500 50  0001 C CNN "Supplier"
	1    5600 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 3650 5600 3650
Wire Wire Line
	5600 3650 5600 3600
Wire Wire Line
	5450 3300 5600 3300
Wire Wire Line
	5600 3300 5600 3400
$Comp
L power:+3.3V #PWR0107
U 1 1 5E946AC2
P 5600 3300
F 0 "#PWR0107" H 5600 3150 50  0001 C CNN
F 1 "+3.3V" H 5615 3473 50  0000 C CNN
F 2 "" H 5600 3300 50  0001 C CNN
F 3 "" H 5600 3300 50  0001 C CNN
	1    5600 3300
	1    0    0    -1  
$EndComp
Connection ~ 5600 3300
Text Label 8100 3650 2    50   ~ 0
PP_con
$Comp
L Device:C_Small C19
U 1 1 5E949D36
P 6150 3250
F 0 "C19" H 6242 3296 50  0000 L CNN
F 1 "270p" H 6242 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6150 3250 50  0001 C CNN
F 3 "~" H 6150 3250 50  0001 C CNN
F 4 "Yageo CC0603JRNPO9BN271B Keramik-Kondensator SMD 0603 270 pF 50 V 5 % " H 6150 3250 50  0001 C CNN "Part"
F 5 "445791" H 6150 3250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 6150 3250 50  0001 C CNN "Supplier"
	1    6150 3250
	1    0    0    -1  
$EndComp
Connection ~ 6150 2850
Wire Wire Line
	6150 2850 6350 2850
Wire Wire Line
	6150 3150 6150 2850
Wire Wire Line
	6150 4500 6150 3350
Connection ~ 4650 4500
Wire Wire Line
	5250 4500 6150 4500
Connection ~ 5250 4500
Wire Wire Line
	4650 4500 5250 4500
Wire Wire Line
	5450 3900 5450 3300
Wire Wire Line
	5250 3900 5450 3900
Wire Wire Line
	4900 4200 4900 3650
Wire Wire Line
	5050 4200 4900 4200
$Comp
L Diode:BAT54S D5
U 1 1 5E93ED73
P 5250 4200
F 0 "D5" V 5296 4288 50  0000 L CNN
F 1 "BAT64-04" V 5205 4288 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5325 4325 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 5130 4200 50  0001 C CNN
F 4 "Gleichrichter BAT64-04 (Dual) SOT-23-3 40 V Array - 1 Paar in Reihe" H 5250 4200 50  0001 C CNN "Part"
F 5 "152998 " H 5250 4200 50  0001 C CNN "PartNo"
F 6 "Conrad" H 5250 4200 50  0001 C CNN "Supplier"
	1    5250 4200
	0    1    -1   0   
$EndComp
Connection ~ 4250 4500
Wire Wire Line
	4250 4500 4650 4500
Wire Wire Line
	6350 2850 6550 2850
Connection ~ 6350 2850
$Comp
L Diode:1N4148 D6
U 1 1 5E95B772
P 6550 3250
F 0 "D6" V 6504 3329 50  0000 L CNN
F 1 "SM6T15A" V 6595 3329 50  0000 L CNN
F 2 "Diode_SMD:D_SMB_Handsoldering" H 6550 3075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6550 3250 50  0001 C CNN
F 4 "SM6T15A-E3/52 DO-214AA 14.3 V 600 W" H 6550 3250 50  0001 C CNN "Part"
F 5 "596320 " H 6550 3250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 6550 3250 50  0001 C CNN "Supplier"
	1    6550 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 2850 6550 3100
Wire Wire Line
	6550 3400 6550 4500
Wire Wire Line
	6550 4500 6150 4500
Connection ~ 6150 4500
Wire Wire Line
	6550 2850 6900 2850
Wire Wire Line
	6900 2850 6900 3200
Connection ~ 6550 2850
Text Label 8100 3200 2    50   ~ 0
CP_con
$Comp
L Diode:BAT54S D7
U 1 1 5E9604E7
P 7100 2800
F 0 "D7" V 7146 2888 50  0000 L CNN
F 1 "BAT64-04" V 7055 2888 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7175 2925 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 6980 2800 50  0001 C CNN
F 4 "Gleichrichter BAT64-04 (Dual) SOT-23-3 40 V Array - 1 Paar in Reihe" H 7100 2800 50  0001 C CNN "Part"
F 5 "152998 " H 7100 2800 50  0001 C CNN "PartNo"
F 6 "Conrad" H 7100 2800 50  0001 C CNN "Supplier"
	1    7100 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 3100 7100 4500
Wire Wire Line
	7100 4500 6550 4500
Connection ~ 6550 4500
$Comp
L power:+3.3V #PWR0108
U 1 1 5E966B71
P 7100 2500
F 0 "#PWR0108" H 7100 2350 50  0001 C CNN
F 1 "+3.3V" H 7115 2673 50  0000 C CNN
F 2 "" H 7100 2500 50  0001 C CNN
F 3 "" H 7100 2500 50  0001 C CNN
	1    7100 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R24
U 1 1 5E968C58
P 8150 2700
F 0 "R24" V 8250 2700 50  0000 C CNN
F 1 "100" V 8045 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8150 2700 50  0001 C CNN
F 3 "~" H 8150 2700 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0101T5E203 Dickschicht-Widerstand 100 Ω SMD 0603 0.1 W" H 8150 2700 50  0001 C CNN "Part"
F 5 "1583838 " H 8150 2700 50  0001 C CNN "PartNo"
F 6 "Conrad" H 8150 2700 50  0001 C CNN "Supplier"
	1    8150 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 2700 8500 2700
$Comp
L power:GND #PWR0109
U 1 1 5E96AA66
P 8500 2500
F 0 "#PWR0109" H 8500 2250 50  0001 C CNN
F 1 "GND" V 8505 2372 50  0000 R CNN
F 2 "" H 8500 2500 50  0001 C CNN
F 3 "" H 8500 2500 50  0001 C CNN
	1    8500 2500
	0    1    1    0   
$EndComp
Text HLabel 8500 2600 0    50   Input ~ 0
LED
Text HLabel 8300 2200 0    50   BiDi ~ 0
RS485_A
Text HLabel 8300 2300 0    50   BiDi ~ 0
RS485_B
NoConn ~ 8500 2800
Text HLabel 8500 2900 0    50   Output ~ 0
Lock_B
Text HLabel 8500 3000 0    50   Input ~ 0
Lock_R
Text HLabel 8500 3100 0    50   Input ~ 0
Lock_W
Text HLabel 3850 3650 0    50   Output ~ 0
PP
Text HLabel 7500 2300 1    50   Output ~ 0
Button
Text HLabel 6000 5400 0    50   Input ~ 0
Reed_Relay
Wire Notes Line
	5050 800  5050 2450
Wire Notes Line
	6650 2450 6650 800 
Wire Notes Line
	6650 800  5050 800 
Text Notes 6050 750  2    50   ~ 0
Opamp Buffer\n
Wire Notes Line
	4550 2450 4550 3150
Wire Notes Line
	4550 3150 5900 3150
Wire Notes Line
	5900 3150 5900 2450
Wire Notes Line
	4550 2450 6650 2450
Text Notes 5400 3250 2    50   ~ 0
Comparator\n
$Comp
L smartevse:Reed_Relay_DPST_NC K1
U 1 1 5E9A6E64
P 8150 5400
F 0 "K1" V 7483 5400 50  0000 C CNN
F 1 "Reed Relay DPST NC" V 7574 5400 50  0000 C CNN
F 2 "" H 8650 5350 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 8150 5400 50  0001 C CNN
	1    8150 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3650 7150 3650
Connection ~ 5600 3650
Wire Wire Line
	6900 3200 7150 3200
Wire Wire Line
	8500 3200 8100 3200
Text Label 7150 3200 0    50   ~ 0
CP_to_relay
Text Label 7150 3650 0    50   ~ 0
PP_to_relay
Text Label 7700 5800 2    50   ~ 0
PP_to_relay
Text Label 7700 5500 2    50   ~ 0
CP_to_relay
Wire Wire Line
	7700 5500 7850 5500
Wire Wire Line
	7700 5800 7850 5800
Wire Wire Line
	8450 5500 8600 5500
Wire Wire Line
	8600 5800 8450 5800
Text Label 8600 5500 0    50   ~ 0
CP_con
Text Label 8600 5800 0    50   ~ 0
PP_con
Wire Wire Line
	7850 5100 7550 5100
Wire Wire Line
	7050 5100 7050 5200
Wire Wire Line
	8450 5100 8500 5100
Wire Wire Line
	8700 5100 8700 4850
$Comp
L power:+12V #PWR029
U 1 1 5E9D6AB9
P 8700 4850
F 0 "#PWR029" H 8700 4700 50  0001 C CNN
F 1 "+12V" H 8715 5023 50  0000 C CNN
F 2 "" H 8700 4850 50  0001 C CNN
F 3 "" H 8700 4850 50  0001 C CNN
	1    8700 4850
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 5E9D7037
P 6950 5400
F 0 "Q2" H 7141 5446 50  0000 L CNN
F 1 "2N2222 or similar" H 6850 5200 50  0000 L CNN
F 2 "" H 7150 5325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 6950 5400 50  0001 L CNN
	1    6950 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5E9D987E
P 6300 5400
F 0 "R14" V 6104 5400 50  0000 C CNN
F 1 "2.2k" V 6195 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6300 5400 50  0001 C CNN
F 3 "~" H 6300 5400 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0222T5E203 Dickschicht-Widerstand 2.2 kΩ SMD 0603 0.1 W" H 6300 5400 50  0001 C CNN "Part"
F 5 "1585814 " H 6300 5400 50  0001 C CNN "PartNo"
F 6 "Conrad" H 6300 5400 50  0001 C CNN "Supplier"
	1    6300 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5E9DA4DD
P 6550 5650
F 0 "R17" H 6491 5604 50  0000 R CNN
F 1 "22k" H 6491 5695 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6550 5650 50  0001 C CNN
F 3 "~" H 6550 5650 50  0001 C CNN
F 4 "TRU COMPONENTS TC-HP03W5F2202T5E203 Dickschicht-Widerstand 22 kΩ SMD 0603 0.2 W 1 % " H 6550 5650 50  0001 C CNN "Part"
F 5 "1584163 " H 6550 5650 50  0001 C CNN "PartNo"
F 6 "Conrad" H 6550 5650 50  0001 C CNN "Supplier"
	1    6550 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7050 5600 7050 5850
Wire Wire Line
	7050 5850 6800 5850
Wire Wire Line
	6550 5850 6550 5750
Wire Wire Line
	6550 5550 6550 5400
Wire Wire Line
	6550 5400 6400 5400
Wire Wire Line
	6550 5400 6750 5400
Connection ~ 6550 5400
$Comp
L power:GND #PWR028
U 1 1 5E9E16AA
P 6800 5850
F 0 "#PWR028" H 6800 5600 50  0001 C CNN
F 1 "GND" H 6805 5677 50  0000 C CNN
F 2 "" H 6800 5850 50  0001 C CNN
F 3 "" H 6800 5850 50  0001 C CNN
	1    6800 5850
	1    0    0    -1  
$EndComp
Connection ~ 6800 5850
Wire Wire Line
	6800 5850 6550 5850
Text HLabel 900  5200 0    50   Output ~ 0
CT0
Connection ~ 1300 5200
Wire Wire Line
	1300 5200 900  5200
$Comp
L power:GND #PWR?
U 1 1 5EC179B9
P 1300 5450
AR Path="/5E98FA8A/5EC179B9" Ref="#PWR?"  Part="1" 
AR Path="/5E903BF9/5EC179B9" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 1300 5200 50  0001 C CNN
F 1 "GND" H 1305 5277 50  0000 C CNN
F 2 "" H 1300 5450 50  0001 C CNN
F 3 "" H 1300 5450 50  0001 C CNN
	1    1300 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 5250 1300 5200
$Comp
L Device:C_Small C?
U 1 1 5EC179C0
P 1300 5350
AR Path="/5E98FA8A/5EC179C0" Ref="C?"  Part="1" 
AR Path="/5E903BF9/5EC179C0" Ref="C23"  Part="1" 
F 0 "C23" H 1392 5396 50  0000 L CNN
F 1 "100n" H 1392 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1300 5350 50  0001 C CNN
F 3 "~" H 1300 5350 50  0001 C CNN
F 4 "Kemet C0603C104K3RAC7867+ Keramik-Kondensator SMD 0603 100 nF 25 V 10 %" H 1300 5350 50  0001 C CNN "Part"
F 5 "1420339" H 1300 5350 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1300 5350 50  0001 C CNN "Supplier"
	1    1300 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 5200 1300 5200
Text Label 1550 5600 2    50   ~ 0
BIAS
Connection ~ 1950 5600
Wire Wire Line
	1950 5600 1550 5600
Wire Wire Line
	1950 5600 1950 5550
Wire Wire Line
	2450 5600 1950 5600
Wire Wire Line
	1950 5200 1750 5200
Connection ~ 1950 5200
Wire Wire Line
	1950 5350 1950 5200
$Comp
L Device:R_Small R?
U 1 1 5EC179D4
P 1650 5200
AR Path="/5E98FA8A/5EC179D4" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC179D4" Ref="R28"  Part="1" 
F 0 "R28" V 1454 5200 50  0000 C CNN
F 1 "100" V 1545 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1650 5200 50  0001 C CNN
F 3 "~" H 1650 5200 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0101T5E203 Dickschicht-Widerstand 100 Ω SMD 0603 0.1 W" H 1650 5200 50  0001 C CNN "Part"
F 5 "1583838 " H 1650 5200 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1650 5200 50  0001 C CNN "Supplier"
	1    1650 5200
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EC179DA
P 1950 5450
AR Path="/5E98FA8A/5EC179DA" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC179DA" Ref="R31"  Part="1" 
F 0 "R31" H 2009 5496 50  0000 L CNN
F 1 "22" H 2009 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1950 5450 50  0001 C CNN
F 3 "~" H 1950 5450 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0220T5E203 Dickschicht-Widerstand 22 Ω SMD 0603 0.1 W 5 %" H 1950 5450 50  0001 C CNN "Part"
F 5 "1585778 " H 1950 5450 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1950 5450 50  0001 C CNN "Supplier"
	1    1950 5450
	-1   0    0    -1  
$EndComp
Text HLabel 900  6100 0    50   Output ~ 0
CT1
Connection ~ 1300 6100
Wire Wire Line
	1300 6100 900  6100
$Comp
L power:GND #PWR?
U 1 1 5EC179E9
P 1300 6350
AR Path="/5E98FA8A/5EC179E9" Ref="#PWR?"  Part="1" 
AR Path="/5E903BF9/5EC179E9" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 1300 6100 50  0001 C CNN
F 1 "GND" H 1305 6177 50  0000 C CNN
F 2 "" H 1300 6350 50  0001 C CNN
F 3 "" H 1300 6350 50  0001 C CNN
	1    1300 6350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 6150 1300 6100
$Comp
L Device:C_Small C?
U 1 1 5EC179F0
P 1300 6250
AR Path="/5E98FA8A/5EC179F0" Ref="C?"  Part="1" 
AR Path="/5E903BF9/5EC179F0" Ref="C24"  Part="1" 
F 0 "C24" H 1392 6296 50  0000 L CNN
F 1 "100n" H 1392 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1300 6250 50  0001 C CNN
F 3 "~" H 1300 6250 50  0001 C CNN
F 4 "Kemet C0603C104K3RAC7867+ Keramik-Kondensator SMD 0603 100 nF 25 V 10 %" H 1300 6250 50  0001 C CNN "Part"
F 5 "1420339" H 1300 6250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1300 6250 50  0001 C CNN "Supplier"
	1    1300 6250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 6100 1300 6100
Text Label 1550 6500 2    50   ~ 0
BIAS
Connection ~ 1950 6500
Wire Wire Line
	1950 6500 1550 6500
Wire Wire Line
	1950 6500 1950 6450
Wire Wire Line
	2450 6500 1950 6500
Wire Wire Line
	1950 6100 1750 6100
Connection ~ 1950 6100
Wire Wire Line
	1950 6250 1950 6100
$Comp
L Device:R_Small R?
U 1 1 5EC17A04
P 1650 6100
AR Path="/5E98FA8A/5EC17A04" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A04" Ref="R29"  Part="1" 
F 0 "R29" V 1454 6100 50  0000 C CNN
F 1 "100" V 1545 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1650 6100 50  0001 C CNN
F 3 "~" H 1650 6100 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0101T5E203 Dickschicht-Widerstand 100 Ω SMD 0603 0.1 W" H 1650 6100 50  0001 C CNN "Part"
F 5 "1583838 " H 1650 6100 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1650 6100 50  0001 C CNN "Supplier"
	1    1650 6100
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EC17A0A
P 1950 6350
AR Path="/5E98FA8A/5EC17A0A" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A0A" Ref="R32"  Part="1" 
F 0 "R32" H 2009 6396 50  0000 L CNN
F 1 "22" H 2009 6305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1950 6350 50  0001 C CNN
F 3 "~" H 1950 6350 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0220T5E203 Dickschicht-Widerstand 22 Ω SMD 0603 0.1 W 5 %" H 1950 6350 50  0001 C CNN "Part"
F 5 "1585778 " H 1950 6350 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1950 6350 50  0001 C CNN "Supplier"
	1    1950 6350
	-1   0    0    -1  
$EndComp
Text HLabel 900  7000 0    50   Output ~ 0
CT2
Connection ~ 1300 7000
Wire Wire Line
	1300 7000 900  7000
$Comp
L power:GND #PWR?
U 1 1 5EC17A19
P 1300 7250
AR Path="/5E98FA8A/5EC17A19" Ref="#PWR?"  Part="1" 
AR Path="/5E903BF9/5EC17A19" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 1300 7000 50  0001 C CNN
F 1 "GND" H 1305 7077 50  0000 C CNN
F 2 "" H 1300 7250 50  0001 C CNN
F 3 "" H 1300 7250 50  0001 C CNN
	1    1300 7250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 7050 1300 7000
$Comp
L Device:C_Small C?
U 1 1 5EC17A20
P 1300 7150
AR Path="/5E98FA8A/5EC17A20" Ref="C?"  Part="1" 
AR Path="/5E903BF9/5EC17A20" Ref="C25"  Part="1" 
F 0 "C25" H 1392 7196 50  0000 L CNN
F 1 "100n" H 1392 7105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1300 7150 50  0001 C CNN
F 3 "~" H 1300 7150 50  0001 C CNN
F 4 "Kemet C0603C104K3RAC7867+ Keramik-Kondensator SMD 0603 100 nF 25 V 10 %" H 1300 7150 50  0001 C CNN "Part"
F 5 "1420339" H 1300 7150 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1300 7150 50  0001 C CNN "Supplier"
	1    1300 7150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 7000 1300 7000
Text Label 1550 7400 2    50   ~ 0
BIAS
Connection ~ 1950 7400
Wire Wire Line
	1950 7400 1550 7400
Wire Wire Line
	1950 7400 1950 7350
Wire Wire Line
	2450 7400 1950 7400
Wire Wire Line
	1950 7000 1750 7000
Connection ~ 1950 7000
Wire Wire Line
	1950 7150 1950 7000
$Comp
L Device:R_Small R?
U 1 1 5EC17A34
P 1650 7000
AR Path="/5E98FA8A/5EC17A34" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A34" Ref="R30"  Part="1" 
F 0 "R30" V 1454 7000 50  0000 C CNN
F 1 "100" V 1545 7000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1650 7000 50  0001 C CNN
F 3 "~" H 1650 7000 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0101T5E203 Dickschicht-Widerstand 100 Ω SMD 0603 0.1 W" H 1650 7000 50  0001 C CNN "Part"
F 5 "1583838 " H 1650 7000 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1650 7000 50  0001 C CNN "Supplier"
	1    1650 7000
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EC17A3A
P 1950 7250
AR Path="/5E98FA8A/5EC17A3A" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A3A" Ref="R33"  Part="1" 
F 0 "R33" H 2009 7296 50  0000 L CNN
F 1 "22" H 2009 7205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1950 7250 50  0001 C CNN
F 3 "~" H 1950 7250 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0220T5E203 Dickschicht-Widerstand 22 Ω SMD 0603 0.1 W 5 %" H 1950 7250 50  0001 C CNN "Part"
F 5 "1585778 " H 1950 7250 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1950 7250 50  0001 C CNN "Supplier"
	1    1950 7250
	-1   0    0    -1  
$EndComp
Wire Notes Line
	3250 4900 3250 7700
Wire Notes Line
	3250 7700 550  7700
Wire Notes Line
	550  7700 550  4900
Wire Notes Line
	550  4900 3250 4900
Text Notes 1150 7650 0    50   ~ 0
Current Transformer Input Section\n
Wire Wire Line
	6200 5400 6000 5400
Wire Wire Line
	8100 3650 8100 3300
Wire Wire Line
	8100 3300 8500 3300
Wire Wire Line
	8500 3600 8300 3600
Wire Wire Line
	8500 3700 8300 3700
Wire Wire Line
	8500 3800 8300 3800
Wire Wire Line
	8500 3900 8300 3900
Wire Wire Line
	8500 4000 8300 4000
Wire Wire Line
	8500 4100 8300 4100
Text Label 8300 3600 0    50   ~ 0
CT0_L
Text Label 8300 3700 0    50   ~ 0
CT0_K
Text Label 8300 3800 0    50   ~ 0
CT1_L
Text Label 8300 3900 0    50   ~ 0
CT1_K
Text Label 8300 4000 0    50   ~ 0
CT2_L
Text Label 8300 4100 0    50   ~ 0
CT2_K
Wire Wire Line
	1950 6100 2450 6100
Wire Wire Line
	1950 7000 2450 7000
Wire Wire Line
	1950 5200 2450 5200
Text Label 2450 5200 0    50   ~ 0
CT0_L
Text Label 2450 5600 0    50   ~ 0
CT0_K
Text Label 2450 6100 0    50   ~ 0
CT1_L
Text Label 2450 6500 0    50   ~ 0
CT1_K
Text Label 2450 7000 0    50   ~ 0
CT2_L
Text Label 2450 7400 0    50   ~ 0
CT2_K
$Comp
L power:+3.3V #PWR042
U 1 1 5EC624C4
P 1500 3550
F 0 "#PWR042" H 1500 3400 50  0001 C CNN
F 1 "+3.3V" H 1515 3723 50  0000 C CNN
F 2 "" H 1500 3550 50  0001 C CNN
F 3 "" H 1500 3550 50  0001 C CNN
	1    1500 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5EC624CA
P 1500 4250
F 0 "#PWR043" H 1500 4000 50  0001 C CNN
F 1 "GND" H 1505 4077 50  0000 C CNN
F 2 "" H 1500 4250 50  0001 C CNN
F 3 "" H 1500 4250 50  0001 C CNN
	1    1500 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R27
U 1 1 5EC624D0
P 1500 4050
F 0 "R27" H 1559 4096 50  0000 L CNN
F 1 "10k" H 1559 4005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1500 4050 50  0001 C CNN
F 3 "~" H 1500 4050 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAF1002T5E203 Dickschicht-Widerstand 10 kΩ SMD 0603 0.1 W 1 %" H 1500 4050 50  0001 C CNN "Part"
F 5 "1585269 " H 1500 4050 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1500 4050 50  0001 C CNN "Supplier"
	1    1500 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R26
U 1 1 5EC624D6
P 1500 3700
F 0 "R26" H 1559 3746 50  0000 L CNN
F 1 "10k" H 1559 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1500 3700 50  0001 C CNN
F 3 "~" H 1500 3700 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAF1002T5E203 Dickschicht-Widerstand 10 kΩ SMD 0603 0.1 W 1 %" H 1500 3700 50  0001 C CNN "Part"
F 5 "1585269 " H 1500 3700 50  0001 C CNN "PartNo"
F 6 "Conrad" H 1500 3700 50  0001 C CNN "Supplier"
	1    1500 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3550 1500 3600
Wire Wire Line
	1500 4150 1500 4250
Wire Wire Line
	1500 3800 1500 3850
Wire Wire Line
	1500 3850 1100 3850
Connection ~ 1500 3850
Wire Wire Line
	1500 3850 1500 3950
Text Label 1100 3850 0    50   ~ 0
BIAS
Wire Notes Line
	900  3250 2000 3250
Wire Notes Line
	2000 3250 2000 4650
Wire Notes Line
	2000 4650 900  4650
Wire Notes Line
	900  4650 900  3250
Text Notes 850  4750 0    50   ~ 0
VDD/2 Bias Voltage for CT input\n
NoConn ~ 8500 3400
NoConn ~ 8500 3500
Wire Wire Line
	6200 1150 8400 1150
$Comp
L Device:R_Small R34
U 1 1 5ECD3565
P 7500 2800
F 0 "R34" H 7550 2850 50  0000 L CNN
F 1 "33" H 7559 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7500 2800 50  0001 C CNN
F 3 "~" H 7500 2800 50  0001 C CNN
F 4 "TRU COMPONENTS TC-0603SAJ0330T5E203 Dickschicht-Widerstand 33 Ω SMD 0603 0.1 W 5 % " H 7500 2800 50  0001 C CNN "Part"
F 5 "1584262 " H 7500 2800 50  0001 C CNN "PartNo"
F 6 "Conrad" H 7500 2800 50  0001 C CNN "Supplier"
	1    7500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2700 7700 2700
Wire Wire Line
	7500 2700 7500 2300
Connection ~ 7500 2700
Wire Wire Line
	7300 2800 7300 2700
Wire Wire Line
	7300 2700 7500 2700
$Comp
L Device:D_Zener_Small D8
U 1 1 5ECE49DD
P 7700 2800
F 0 "D8" V 7654 2868 50  0000 L CNN
F 1 "3.3V Zener" V 7745 2868 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" V 7700 2800 50  0001 C CNN
F 3 "~" V 7700 2800 50  0001 C CNN
F 4 "TC-ZMM3.3 Gehäuseart (Halbleiter) SOD-80C Zener-Spannung 3.3 V" H 7700 2800 50  0001 C CNN "Part"
F 5 "1581796 " H 7700 2800 50  0001 C CNN "PartNo"
F 6 "Conrad" H 7700 2800 50  0001 C CNN "Supplier"
	1    7700 2800
	0    1    1    0   
$EndComp
Connection ~ 7100 3100
Wire Wire Line
	7500 2900 7500 3100
Wire Wire Line
	7100 3100 7500 3100
Connection ~ 7500 2900
Connection ~ 7700 2700
Wire Wire Line
	7700 2900 7500 2900
Wire Wire Line
	7700 2700 8050 2700
Text Label 8400 2400 2    50   ~ 0
12V_Fused
$Comp
L Device:D_Small D9
U 1 1 5ECFD670
P 8100 4600
F 0 "D9" H 8100 4395 50  0000 C CNN
F 1 "Only needed if not included in relay" H 8100 4486 50  0000 C CNN
F 2 "" V 8100 4600 50  0001 C CNN
F 3 "~" V 8100 4600 50  0001 C CNN
	1    8100 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4600 8500 4600
Wire Wire Line
	8500 4600 8500 5100
Connection ~ 8500 5100
Wire Wire Line
	8500 5100 8700 5100
Wire Wire Line
	8000 4600 7550 4600
Wire Wire Line
	7550 4600 7550 5100
Connection ~ 7550 5100
Wire Wire Line
	7550 5100 7050 5100
$EndSCHEMATC
