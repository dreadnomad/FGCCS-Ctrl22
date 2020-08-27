EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "FGCCS-Ctrl22"
Date "2020-08-11"
Rev "1.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8500 2200 8300 2200
Wire Wire Line
	8500 2300 8300 2300
$Comp
L Device:Polyfuse_Small F1
U 1 1 5E90649F
P 7850 1850
F 0 "F1" H 7918 1896 50  0000 L CNN
F 1 "FSMD020 " H 7918 1805 50  0000 L CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" H 7900 1650 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/240/Littelfuse_PTC_1812L_Datasheet.pdf-693388.pdf" H 7850 1850 50  0001 C CNN
F 4 "" H 7850 1850 50  0001 C CNN "Part"
F 5 "576-1812L020PR " H 7850 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7850 1850 50  0001 C CNN "Supplier"
	1    7850 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C20
U 1 1 5E906C0D
P 6200 1300
F 0 "C20" H 6292 1346 50  0000 L CNN
F 1 "100n" H 6292 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6200 1300 50  0001 C CNN
F 3 "~" H 6200 1300 50  0001 C CNN
F 4 "" H 6200 1300 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 6200 1300 50  0001 C CNN "PartNo"
F 6 "Mouser" H 6200 1300 50  0001 C CNN "Supplier"
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
U 2 1 5E913218
P 5400 2850
F 0 "U11" H 5400 3217 50  0000 C CNN
F 1 "LM7332" H 5400 3126 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5400 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm7332.pdf?HQS=TI-null-null-mousermode-df-pf-null-wwe&ts=1590747908099" H 5400 2850 50  0001 C CNN
F 4 "Mouser" H 5400 2850 50  0001 C CNN "Supplier"
F 5 "926-LM7332MA/NOPB" H 5400 2850 50  0001 C CNN "PartNo"
	2    5400 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:Opamp_Dual_Generic U11
U 3 1 5E913947
P 5800 1800
F 0 "U11" H 5758 1846 50  0000 L CNN
F 1 "LM7332" H 5758 1755 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5800 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm7332.pdf?HQS=TI-null-null-mousermode-df-pf-null-wwe&ts=1590747908099" H 5800 1800 50  0001 C CNN
F 4 "Mouser" H 5800 1800 50  0001 C CNN "Supplier"
F 5 "926-LM7332MA/NOPB" H 5800 1800 50  0001 C CNN "PartNo"
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
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 2250 50  0001 C CNN
F 3 "~" H 6000 2250 50  0001 C CNN
F 4 "" H 6000 2250 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 6000 2250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 6000 2250 50  0001 C CNN "Supplier"
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
F 4 "" H 5950 2850 50  0001 C CNN "Part"
F 5 "594-MCT06030C1001FP5 " H 5950 2850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5950 2850 50  0001 C CNN "Supplier"
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
F 4 "" H 4650 2250 50  0001 C CNN "Part"
F 5 "594-MCT06030C1502FP5" H 4650 2250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 4650 2250 50  0001 C CNN "Supplier"
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
F 4 "" H 4650 3350 50  0001 C CNN "Part"
F 5 "594-MCT06030C1502FP5" H 4650 3350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 4650 3350 50  0001 C CNN "Supplier"
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
F 4 "" H 4850 2750 50  0001 C CNN "Part"
F 5 "594-MCT06030C1502FP5" H 4850 2750 50  0001 C CNN "PartNo"
F 6 "Mouser" H 4850 2750 50  0001 C CNN "Supplier"
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
F 4 "" H 4250 3350 50  0001 C CNN "Part"
F 5 "594-MCT06030C1502FP5" H 4250 3350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 4250 3350 50  0001 C CNN "Supplier"
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
F 4 "" H 4250 2250 50  0001 C CNN "Part"
F 5 "594-MCT06030C1002FP5 " H 4250 2250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 4250 2250 50  0001 C CNN "Supplier"
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
$Comp
L Device:R_Small R13
U 1 1 5E923E93
P 3950 2250
F 0 "R13" H 4009 2296 50  0000 L CNN
F 1 "40.2k" H 4009 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3950 2250 50  0001 C CNN
F 3 "~" H 3950 2250 50  0001 C CNN
F 4 "" H 3950 2250 50  0001 C CNN "Part"
F 5 "594-MCT06030C4022FP5 " H 3950 2250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 3950 2250 50  0001 C CNN "Supplier"
	1    3950 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2350 3950 2450
Connection ~ 3950 2450
Wire Wire Line
	3950 2450 3900 2450
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
F 4 "" H 5200 3650 50  0001 C CNN "Part"
F 5 "594-MCT06030C1002FP5 " H 5200 3650 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5200 3650 50  0001 C CNN "Supplier"
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
F 4 "" H 5600 3500 50  0001 C CNN "Part"
F 5 "594-MCT06030C1001FP5 " H 5600 3500 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5600 3500 50  0001 C CNN "Supplier"
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
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 3250 50  0001 C CNN
F 3 "~" H 6150 3250 50  0001 C CNN
F 4 "" H 6150 3250 50  0001 C CNN "Part"
F 5 "77-VJ0805A271KXJPBC " H 6150 3250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 6150 3250 50  0001 C CNN "Supplier"
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
F 1 "BAT54S" V 5205 4288 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5325 4325 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 5130 4200 50  0001 C CNN
F 4 "" H 5250 4200 50  0001 C CNN "Part"
F 5 "583-BAT54S " H 5250 4200 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5250 4200 50  0001 C CNN "Supplier"
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
F 1 "SMAJ13CA" V 6595 3329 50  0000 L CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 6550 3075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 6550 3250 50  0001 C CNN
F 4 "" H 6550 3250 50  0001 C CNN "Part"
F 5 "652-SMAJ13CA " H 6550 3250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 6550 3250 50  0001 C CNN "Supplier"
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
Text Label 8100 3100 2    50   ~ 0
CP_con
$Comp
L Diode:BAT54S D7
U 1 1 5E9604E7
P 7100 2600
F 0 "D7" V 7146 2688 50  0000 L CNN
F 1 "BAT54S" V 7055 2688 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7175 2725 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 6980 2600 50  0001 C CNN
F 4 "" H 7100 2600 50  0001 C CNN "Part"
F 5 "583-BAT54S " H 7100 2600 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7100 2600 50  0001 C CNN "Supplier"
	1    7100 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7100 4500 6550 4500
Connection ~ 6550 4500
$Comp
L power:+3.3V #PWR0108
U 1 1 5E966B71
P 7100 2300
F 0 "#PWR0108" H 7100 2150 50  0001 C CNN
F 1 "+3.3V" H 7115 2473 50  0000 C CNN
F 2 "" H 7100 2300 50  0001 C CNN
F 3 "" H 7100 2300 50  0001 C CNN
	1    7100 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R24
U 1 1 5E968C58
P 8150 2600
F 0 "R24" V 8200 2750 50  0000 C CNN
F 1 "1k" V 8045 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8150 2600 50  0001 C CNN
F 3 "~" H 8150 2600 50  0001 C CNN
F 4 "" H 8150 2600 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 8150 2600 50  0001 C CNN "PartNo"
F 6 "Mouser" H 8150 2600 50  0001 C CNN "Supplier"
	1    8150 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5E96AA66
P 8500 2400
F 0 "#PWR0109" H 8500 2150 50  0001 C CNN
F 1 "GND" V 8505 2272 50  0000 R CNN
F 2 "" H 8500 2400 50  0001 C CNN
F 3 "" H 8500 2400 50  0001 C CNN
	1    8500 2400
	0    1    1    0   
$EndComp
Text HLabel 8500 2500 0    50   Input ~ 0
LED
Text HLabel 8300 2200 0    50   BiDi ~ 0
RS485_A
Text HLabel 8300 2300 0    50   BiDi ~ 0
RS485_B
Text HLabel 8500 2800 0    50   Output ~ 0
Lock_B
Text HLabel 8500 2900 0    50   Input ~ 0
Lock_R
Text HLabel 8500 3000 0    50   Input ~ 0
Lock_W
Text HLabel 3850 3650 0    50   Output ~ 0
PP
Text HLabel 7500 2300 1    50   Output ~ 0
Button
Text HLabel 5850 5400 0    50   Input ~ 0
Signal_Relay
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
Wire Wire Line
	5600 3650 7150 3650
Connection ~ 5600 3650
Wire Wire Line
	6900 3200 7150 3200
Text Label 7150 3200 0    50   ~ 0
CP_to_relay
Text Label 7150 3650 0    50   ~ 0
PP_to_relay
Text HLabel 950  5150 0    50   Output ~ 0
CT0
$Comp
L power:GND #PWR?
U 1 1 5EC179B9
P 2000 5400
AR Path="/5E98FA8A/5EC179B9" Ref="#PWR?"  Part="1" 
AR Path="/5E903BF9/5EC179B9" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 2000 5150 50  0001 C CNN
F 1 "GND" H 2005 5227 50  0000 C CNN
F 2 "" H 2000 5400 50  0001 C CNN
F 3 "" H 2000 5400 50  0001 C CNN
	1    2000 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2000 5200 2000 5150
$Comp
L Device:C_Small C?
U 1 1 5EC179C0
P 2000 5300
AR Path="/5E98FA8A/5EC179C0" Ref="C?"  Part="1" 
AR Path="/5E903BF9/5EC179C0" Ref="C23"  Part="1" 
F 0 "C23" H 2092 5346 50  0000 L CNN
F 1 "100n" H 2092 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 5300 50  0001 C CNN
F 3 "~" H 2000 5300 50  0001 C CNN
F 4 "" H 2000 5300 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 2000 5300 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2000 5300 50  0001 C CNN "Supplier"
	1    2000 5300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 5150 2000 5150
Text Label 2250 5550 2    50   ~ 0
BIAS
Connection ~ 2650 5550
Wire Wire Line
	2650 5550 2250 5550
Wire Wire Line
	2650 5550 2650 5500
Wire Wire Line
	3150 5550 2650 5550
Wire Wire Line
	2650 5150 2450 5150
Connection ~ 2650 5150
Wire Wire Line
	2650 5300 2650 5150
$Comp
L Device:R_Small R?
U 1 1 5EC179D4
P 2350 5150
AR Path="/5E98FA8A/5EC179D4" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC179D4" Ref="R28"  Part="1" 
F 0 "R28" V 2154 5150 50  0000 C CNN
F 1 "100" V 2245 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2350 5150 50  0001 C CNN
F 3 "~" H 2350 5150 50  0001 C CNN
F 4 "" H 2350 5150 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 2350 5150 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2350 5150 50  0001 C CNN "Supplier"
	1    2350 5150
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EC179DA
P 2650 5400
AR Path="/5E98FA8A/5EC179DA" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC179DA" Ref="R31"  Part="1" 
F 0 "R31" H 2709 5446 50  0000 L CNN
F 1 "22" H 2709 5355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2650 5400 50  0001 C CNN
F 3 "~" H 2650 5400 50  0001 C CNN
F 4 "" H 2650 5400 50  0001 C CNN "Part"
F 5 "594-MCT06030C2209FP5 " H 2650 5400 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2650 5400 50  0001 C CNN "Supplier"
	1    2650 5400
	-1   0    0    -1  
$EndComp
Text HLabel 950  6050 0    50   Output ~ 0
CT1
$Comp
L power:GND #PWR?
U 1 1 5EC179E9
P 2000 6300
AR Path="/5E98FA8A/5EC179E9" Ref="#PWR?"  Part="1" 
AR Path="/5E903BF9/5EC179E9" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 2000 6050 50  0001 C CNN
F 1 "GND" H 2005 6127 50  0000 C CNN
F 2 "" H 2000 6300 50  0001 C CNN
F 3 "" H 2000 6300 50  0001 C CNN
	1    2000 6300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2000 6100 2000 6050
$Comp
L Device:C_Small C?
U 1 1 5EC179F0
P 2000 6200
AR Path="/5E98FA8A/5EC179F0" Ref="C?"  Part="1" 
AR Path="/5E903BF9/5EC179F0" Ref="C24"  Part="1" 
F 0 "C24" H 2092 6246 50  0000 L CNN
F 1 "100n" H 2092 6155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 6200 50  0001 C CNN
F 3 "~" H 2000 6200 50  0001 C CNN
F 4 "" H 2000 6200 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 2000 6200 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2000 6200 50  0001 C CNN "Supplier"
	1    2000 6200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 6050 2000 6050
Text Label 2250 6450 2    50   ~ 0
BIAS
Connection ~ 2650 6450
Wire Wire Line
	2650 6450 2250 6450
Wire Wire Line
	2650 6450 2650 6400
Wire Wire Line
	3150 6450 2650 6450
Wire Wire Line
	2650 6050 2450 6050
Connection ~ 2650 6050
Wire Wire Line
	2650 6200 2650 6050
$Comp
L Device:R_Small R?
U 1 1 5EC17A04
P 2350 6050
AR Path="/5E98FA8A/5EC17A04" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A04" Ref="R29"  Part="1" 
F 0 "R29" V 2154 6050 50  0000 C CNN
F 1 "100" V 2245 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2350 6050 50  0001 C CNN
F 3 "~" H 2350 6050 50  0001 C CNN
F 4 "" H 2350 6050 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 2350 6050 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2350 6050 50  0001 C CNN "Supplier"
	1    2350 6050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EC17A0A
P 2650 6300
AR Path="/5E98FA8A/5EC17A0A" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A0A" Ref="R32"  Part="1" 
F 0 "R32" H 2709 6346 50  0000 L CNN
F 1 "22" H 2709 6255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2650 6300 50  0001 C CNN
F 3 "~" H 2650 6300 50  0001 C CNN
F 4 "" H 2650 6300 50  0001 C CNN "Part"
F 5 "594-MCT06030C2209FP5 " H 2650 6300 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2650 6300 50  0001 C CNN "Supplier"
	1    2650 6300
	-1   0    0    -1  
$EndComp
Text HLabel 950  6950 0    50   Output ~ 0
CT2
$Comp
L power:GND #PWR?
U 1 1 5EC17A19
P 2000 7200
AR Path="/5E98FA8A/5EC17A19" Ref="#PWR?"  Part="1" 
AR Path="/5E903BF9/5EC17A19" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 2000 6950 50  0001 C CNN
F 1 "GND" H 2005 7027 50  0000 C CNN
F 2 "" H 2000 7200 50  0001 C CNN
F 3 "" H 2000 7200 50  0001 C CNN
	1    2000 7200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2000 7000 2000 6950
$Comp
L Device:C_Small C?
U 1 1 5EC17A20
P 2000 7100
AR Path="/5E98FA8A/5EC17A20" Ref="C?"  Part="1" 
AR Path="/5E903BF9/5EC17A20" Ref="C25"  Part="1" 
F 0 "C25" H 2092 7146 50  0000 L CNN
F 1 "100n" H 2092 7055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 7100 50  0001 C CNN
F 3 "~" H 2000 7100 50  0001 C CNN
F 4 "" H 2000 7100 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 2000 7100 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2000 7100 50  0001 C CNN "Supplier"
	1    2000 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 6950 2000 6950
Text Label 2250 7350 2    50   ~ 0
BIAS
Connection ~ 2650 7350
Wire Wire Line
	2650 7350 2250 7350
Wire Wire Line
	2650 7350 2650 7300
Wire Wire Line
	3150 7350 2650 7350
Wire Wire Line
	2650 6950 2450 6950
Connection ~ 2650 6950
Wire Wire Line
	2650 7100 2650 6950
$Comp
L Device:R_Small R?
U 1 1 5EC17A34
P 2350 6950
AR Path="/5E98FA8A/5EC17A34" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A34" Ref="R30"  Part="1" 
F 0 "R30" V 2154 6950 50  0000 C CNN
F 1 "100" V 2245 6950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2350 6950 50  0001 C CNN
F 3 "~" H 2350 6950 50  0001 C CNN
F 4 "" H 2350 6950 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 2350 6950 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2350 6950 50  0001 C CNN "Supplier"
	1    2350 6950
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5EC17A3A
P 2650 7200
AR Path="/5E98FA8A/5EC17A3A" Ref="R?"  Part="1" 
AR Path="/5E903BF9/5EC17A3A" Ref="R33"  Part="1" 
F 0 "R33" H 2709 7246 50  0000 L CNN
F 1 "22" H 2709 7155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2650 7200 50  0001 C CNN
F 3 "~" H 2650 7200 50  0001 C CNN
F 4 "" H 2650 7200 50  0001 C CNN "Part"
F 5 "594-MCT06030C2209FP5 " H 2650 7200 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2650 7200 50  0001 C CNN "Supplier"
	1    2650 7200
	-1   0    0    -1  
$EndComp
Wire Notes Line
	3950 4850 3950 7650
Wire Notes Line
	3950 7650 1250 7650
Wire Notes Line
	1250 7650 1250 4850
Wire Notes Line
	1250 4850 3950 4850
Text Notes 1850 7600 0    50   ~ 0
Current Transformer Input Section\n
Wire Wire Line
	8500 3400 8300 3400
Wire Wire Line
	8500 3500 8300 3500
Wire Wire Line
	8500 3600 8300 3600
Wire Wire Line
	8500 3700 8300 3700
Wire Wire Line
	8500 3800 8300 3800
Wire Wire Line
	8500 3900 8300 3900
Text Label 8300 3400 0    50   ~ 0
CT0_L
Text Label 8300 3500 0    50   ~ 0
CT0_K
Text Label 8300 3600 0    50   ~ 0
CT1_L
Text Label 8300 3700 0    50   ~ 0
CT1_K
Text Label 8300 3800 0    50   ~ 0
CT2_L
Text Label 8300 3900 0    50   ~ 0
CT2_K
Wire Wire Line
	2650 6050 3150 6050
Wire Wire Line
	2650 6950 3150 6950
Wire Wire Line
	2650 5150 3150 5150
Text Label 3150 5150 0    50   ~ 0
CT0_L
Text Label 3150 5550 0    50   ~ 0
CT0_K
Text Label 3150 6050 0    50   ~ 0
CT1_L
Text Label 3150 6450 0    50   ~ 0
CT1_K
Text Label 3150 6950 0    50   ~ 0
CT2_L
Text Label 3150 7350 0    50   ~ 0
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
F 4 "" H 1500 4050 50  0001 C CNN "Part"
F 5 "594-MCT06030C1002FP5 " H 1500 4050 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1500 4050 50  0001 C CNN "Supplier"
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
F 4 "" H 1500 3700 50  0001 C CNN "Part"
F 5 "594-MCT06030C1002FP5 " H 1500 3700 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1500 3700 50  0001 C CNN "Supplier"
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
Wire Wire Line
	6200 1150 7850 1150
$Comp
L smartevse:CPC1114N U12
U 1 1 5ED65855
P 7150 5100
F 0 "U12" H 7150 5425 50  0000 C CNN
F 1 "CPC1114N" H 7150 5334 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 6950 4900 50  0001 L CIN
F 3 "https://www.mouser.de/datasheet/2/240/CPC1114N-1548344.pdf" H 7100 5100 50  0001 L CNN
F 4 "Mouser" H 7150 5100 50  0001 C CNN "Supplier"
F 5 "849-CPC1114N" H 7150 5100 50  0001 C CNN "PartNo"
	1    7150 5100
	1    0    0    -1  
$EndComp
$Comp
L smartevse:CPC1114N U13
U 1 1 5ED672F1
P 7150 5700
F 0 "U13" H 7150 6025 50  0000 C CNN
F 1 "CPC1114N" H 7150 5934 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 6950 5500 50  0001 L CIN
F 3 "https://www.mouser.de/datasheet/2/240/CPC1114N-1548344.pdf" H 7100 5700 50  0001 L CNN
F 4 "Mouser" H 7150 5700 50  0001 C CNN "Supplier"
F 5 "849-CPC1114N" H 7150 5700 50  0001 C CNN "PartNo"
	1    7150 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 5000 7700 5000
Wire Wire Line
	7700 5200 7450 5200
Wire Wire Line
	7700 5600 7450 5600
Wire Wire Line
	7700 5800 7450 5800
Text Label 7700 5000 0    50   ~ 0
PP_to_relay
Text Label 7700 5200 0    50   ~ 0
PP_con
Text Label 7700 5600 0    50   ~ 0
CP_to_relay
Text Label 7700 5800 0    50   ~ 0
CP_con
Wire Wire Line
	6200 5400 6200 5000
Wire Wire Line
	6200 5000 6350 5000
Wire Wire Line
	6200 5400 5850 5400
Wire Wire Line
	6200 5400 6200 5600
Connection ~ 6200 5400
Wire Wire Line
	6850 5200 6600 5200
Wire Wire Line
	6600 5200 6600 5800
Wire Wire Line
	6600 5800 6850 5800
Wire Wire Line
	6600 5800 6600 5900
Connection ~ 6600 5800
$Comp
L power:GND #PWR028
U 1 1 5ED9575E
P 6600 5900
F 0 "#PWR028" H 6600 5650 50  0001 C CNN
F 1 "GND" H 6605 5727 50  0000 C CNN
F 2 "" H 6600 5900 50  0001 C CNN
F 3 "" H 6600 5900 50  0001 C CNN
	1    6600 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5EDA2C13
P 6450 5000
F 0 "R17" V 6254 5000 50  0000 C CNN
F 1 "2k" V 6345 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6450 5000 50  0001 C CNN
F 3 "~" H 6450 5000 50  0001 C CNN
F 4 "Mouser" H 6450 5000 50  0001 C CNN "Supplier"
F 5 "594-MCT06030C2001FP5 " H 6450 5000 50  0001 C CNN "PartNo"
	1    6450 5000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R35
U 1 1 5EDA353F
P 6450 5600
F 0 "R35" V 6254 5600 50  0000 C CNN
F 1 "2k" V 6345 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6450 5600 50  0001 C CNN
F 3 "~" H 6450 5600 50  0001 C CNN
F 4 "Mouser" H 6450 5600 50  0001 C CNN "Supplier"
F 5 "594-MCT06030C2001FP5 " H 6450 5600 50  0001 C CNN "PartNo"
	1    6450 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 5600 6200 5600
Wire Wire Line
	6550 5600 6850 5600
Wire Wire Line
	6550 5000 6850 5000
Connection ~ 5300 1800
$Comp
L Device:Opamp_Dual_Generic U11
U 1 1 5E9126F4
P 5600 1800
F 0 "U11" H 5600 1433 50  0000 C CNN
F 1 "LM7332" H 5600 1524 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5600 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm7332.pdf?HQS=TI-null-null-mousermode-df-pf-null-wwe&ts=1590747908099" H 5600 1800 50  0001 C CNN
F 4 "Mouser" H 5600 1800 50  0001 C CNN "Supplier"
F 5 "926-LM7332MA/NOPB" H 5600 1800 50  0001 C CNN "PartNo"
	1    5600 1800
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x09 J6
U 1 1 5F3444D0
P 8700 2600
F 0 "J6" H 8780 2642 50  0000 L CNN
F 1 "Screw_Terminal_01x09" H 8780 2551 50  0000 L CNN
F 2 "atmevse-footprints:lv_screw_9pin_1" H 8700 2600 50  0001 C CNN
F 3 "~" H 8700 2600 50  0001 C CNN
	1    8700 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x09 J7
U 1 1 5F34567E
P 8700 3500
F 0 "J7" H 8780 3542 50  0000 L CNN
F 1 "Screw_Terminal_01x09" H 8780 3451 50  0000 L CNN
F 2 "atmevse-footprints:lv_screw_9pin_2" H 8700 3500 50  0001 C CNN
F 3 "~" H 8700 3500 50  0001 C CNN
	1    8700 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 1750 7850 1150
Text Label 7850 2500 1    50   ~ 0
12V_Fused
Wire Wire Line
	8500 2600 8250 2600
Wire Wire Line
	8050 2600 7500 2600
Wire Wire Line
	7500 2600 7500 2300
Connection ~ 7500 2600
Wire Wire Line
	7500 2600 7300 2600
Wire Wire Line
	7850 1950 7850 2700
Wire Wire Line
	7850 2700 8500 2700
Wire Wire Line
	8100 3200 8500 3200
Wire Wire Line
	8100 3200 8100 3650
Wire Wire Line
	8100 3100 8500 3100
NoConn ~ 8500 3300
$Comp
L Diode:BAT54S D8
U 1 1 5F402191
P 1350 5500
F 0 "D8" V 1396 5588 50  0000 L CNN
F 1 "BAT54S" V 1305 5588 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1425 5625 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 1230 5500 50  0001 C CNN
	1    1350 5500
	0    -1   -1   0   
$EndComp
$Comp
L Diode:BAT54S D9
U 1 1 5F403CE8
P 1350 6400
F 0 "D9" V 1396 6488 50  0000 L CNN
F 1 "BAT54S" V 1305 6488 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1425 6525 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 1230 6400 50  0001 C CNN
	1    1350 6400
	0    -1   -1   0   
$EndComp
$Comp
L Diode:BAT54S D10
U 1 1 5F404582
P 1350 7300
F 0 "D10" V 1396 7388 50  0000 L CNN
F 1 "BAT54S" V 1305 7388 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 1425 7425 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 1230 7300 50  0001 C CNN
	1    1350 7300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5F405023
P 1350 5800
F 0 "#PWR045" H 1350 5550 50  0001 C CNN
F 1 "GND" H 1355 5627 50  0000 C CNN
F 2 "" H 1350 5800 50  0001 C CNN
F 3 "" H 1350 5800 50  0001 C CNN
	1    1350 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR046
U 1 1 5F405A5C
P 1350 6700
F 0 "#PWR046" H 1350 6450 50  0001 C CNN
F 1 "GND" H 1355 6527 50  0000 C CNN
F 2 "" H 1350 6700 50  0001 C CNN
F 3 "" H 1350 6700 50  0001 C CNN
	1    1350 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5F405D93
P 1350 7600
F 0 "#PWR047" H 1350 7350 50  0001 C CNN
F 1 "GND" H 1355 7427 50  0000 C CNN
F 2 "" H 1350 7600 50  0001 C CNN
F 3 "" H 1350 7600 50  0001 C CNN
	1    1350 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6050 1550 6400
Wire Wire Line
	950  6050 1550 6050
Wire Wire Line
	1550 6050 2000 6050
Connection ~ 1550 6050
Connection ~ 2000 6050
Wire Wire Line
	1550 5150 1550 5500
Wire Wire Line
	950  5150 1550 5150
Wire Wire Line
	1550 5150 2000 5150
Connection ~ 1550 5150
Connection ~ 2000 5150
Wire Wire Line
	1550 6950 1550 7300
Wire Wire Line
	950  6950 1550 6950
Wire Wire Line
	1550 6950 2000 6950
Connection ~ 1550 6950
Connection ~ 2000 6950
Wire Wire Line
	1350 7000 1500 7000
Wire Wire Line
	1500 7000 1500 6750
Wire Wire Line
	1350 6100 1500 6100
Wire Wire Line
	1350 5200 1350 5050
$Comp
L power:+3.3V #PWR044
U 1 1 5F435027
P 1350 5050
F 0 "#PWR044" H 1350 4900 50  0001 C CNN
F 1 "+3.3V" H 1365 5223 50  0000 C CNN
F 2 "" H 1350 5050 50  0001 C CNN
F 3 "" H 1350 5050 50  0001 C CNN
	1    1350 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR048
U 1 1 5F43561C
P 1500 5850
F 0 "#PWR048" H 1500 5700 50  0001 C CNN
F 1 "+3.3V" H 1515 6023 50  0000 C CNN
F 2 "" H 1500 5850 50  0001 C CNN
F 3 "" H 1500 5850 50  0001 C CNN
	1    1500 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5850 1500 6100
$Comp
L power:+3.3V #PWR049
U 1 1 5F435A9E
P 1500 6750
F 0 "#PWR049" H 1500 6600 50  0001 C CNN
F 1 "+3.3V" H 1515 6923 50  0000 C CNN
F 2 "" H 1500 6750 50  0001 C CNN
F 3 "" H 1500 6750 50  0001 C CNN
	1    1500 6750
	1    0    0    -1  
$EndComp
$Comp
L Diode:BAT54S D11
U 1 1 5F4367A4
P 3450 2000
F 0 "D11" V 3496 2088 50  0000 L CNN
F 1 "BAT54S" V 3405 2088 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3525 2125 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 3330 2000 50  0001 C CNN
	1    3450 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR050
U 1 1 5F43902A
P 3450 1700
F 0 "#PWR050" H 3450 1550 50  0001 C CNN
F 1 "+3.3V" H 3465 1873 50  0000 C CNN
F 2 "" H 3450 1700 50  0001 C CNN
F 3 "" H 3450 1700 50  0001 C CNN
	1    3450 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 5F439C89
P 3450 2300
F 0 "#PWR051" H 3450 2050 50  0001 C CNN
F 1 "GND" H 3455 2127 50  0000 C CNN
F 2 "" H 3450 2300 50  0001 C CNN
F 3 "" H 3450 2300 50  0001 C CNN
	1    3450 2300
	1    0    0    -1  
$EndComp
Connection ~ 3900 2450
Wire Wire Line
	3900 2450 3850 2450
Wire Wire Line
	3650 2000 3900 2000
Wire Wire Line
	3900 2000 3900 2450
Wire Wire Line
	7100 2900 7100 4500
$EndSCHEMATC
