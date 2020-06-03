EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date "2020-06-01"
Rev "1.0"
Comp ""
Comment1 "DONE: CT inputs on J2"
Comment2 "DONE: Replace reed relays with PhotoMOS"
Comment3 "TODO: verify CT bias voltage divider & CT circuit"
Comment4 "DONE: voltage divider & zener diode on button input"
$EndDescr
$Comp
L Connector:Screw_Terminal_01x18 J2
U 1 1 5E903CA7
P 8700 3000
F 0 "J2" H 8780 2992 50  0000 L CNN
F 1 "Screw_Terminal_01x18" H 8780 2901 50  0000 L CNN
F 2 "atmevse-footprints:CUI_TB004-508-18BE" H 8700 3000 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/324/2/828206-1447938.pdf" H 8700 3000 50  0001 C CNN
F 4 "Mouser" H 8700 3000 50  0001 C CNN "Supplier"
F 5 "490-TB004-508-18BE" H 8700 3000 50  0001 C CNN "PartNo"
	1    8700 3000
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
F 3 "https://www.mouser.de/datasheet/2/240/Littelfuse_PTC_1812L_Datasheet.pdf-693388.pdf" H 8400 1850 50  0001 C CNN
F 4 "" H 8400 1850 50  0001 C CNN "Part"
F 5 "576-1812L020PR " H 8400 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 8400 1850 50  0001 C CNN "Supplier"
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
Text Label 8100 3200 2    50   ~ 0
CP_con
$Comp
L Diode:BAT54S D7
U 1 1 5E9604E7
P 7100 2800
F 0 "D7" V 7146 2888 50  0000 L CNN
F 1 "BAT54S" V 7055 2888 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7175 2925 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 6980 2800 50  0001 C CNN
F 4 "" H 7100 2800 50  0001 C CNN "Part"
F 5 "583-BAT54S " H 7100 2800 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7100 2800 50  0001 C CNN "Supplier"
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
F 4 "" H 8150 2700 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 8150 2700 50  0001 C CNN "PartNo"
F 6 "Mouser" H 8150 2700 50  0001 C CNN "Supplier"
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
Wire Wire Line
	8500 3200 8100 3200
Text Label 7150 3200 0    50   ~ 0
CP_to_relay
Text Label 7150 3650 0    50   ~ 0
PP_to_relay
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
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1300 5350 50  0001 C CNN
F 3 "~" H 1300 5350 50  0001 C CNN
F 4 "" H 1300 5350 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 1300 5350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1300 5350 50  0001 C CNN "Supplier"
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
F 4 "" H 1650 5200 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 1650 5200 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1650 5200 50  0001 C CNN "Supplier"
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
F 4 "" H 1950 5450 50  0001 C CNN "Part"
F 5 "594-MCT06030C2209FP5 " H 1950 5450 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1950 5450 50  0001 C CNN "Supplier"
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
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1300 6250 50  0001 C CNN
F 3 "~" H 1300 6250 50  0001 C CNN
F 4 "" H 1300 6250 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 1300 6250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1300 6250 50  0001 C CNN "Supplier"
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
F 4 "" H 1650 6100 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 1650 6100 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1650 6100 50  0001 C CNN "Supplier"
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
F 4 "" H 1950 6350 50  0001 C CNN "Part"
F 5 "594-MCT06030C2209FP5 " H 1950 6350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1950 6350 50  0001 C CNN "Supplier"
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
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1300 7150 50  0001 C CNN
F 3 "~" H 1300 7150 50  0001 C CNN
F 4 "" H 1300 7150 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 1300 7150 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1300 7150 50  0001 C CNN "Supplier"
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
F 4 "" H 1650 7000 50  0001 C CNN "Part"
F 5 "594-MCT06030C1000FP5 " H 1650 7000 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1650 7000 50  0001 C CNN "Supplier"
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
F 4 "" H 1950 7250 50  0001 C CNN "Part"
F 5 "594-MCT06030C2209FP5 " H 1950 7250 50  0001 C CNN "PartNo"
F 6 "Mouser" H 1950 7250 50  0001 C CNN "Supplier"
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
	8100 3650 8100 3300
Wire Wire Line
	8100 3300 8500 3300
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
	6200 1150 8400 1150
$Comp
L Device:R_Small R34
U 1 1 5ECD3565
P 7500 2800
F 0 "R34" H 7550 2850 50  0000 L CNN
F 1 "33" H 7559 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7500 2800 50  0001 C CNN
F 3 "~" H 7500 2800 50  0001 C CNN
F 4 "" H 7500 2800 50  0001 C CNN "Part"
F 5 "594-MCT06030C3309FP5 " H 7500 2800 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7500 2800 50  0001 C CNN "Supplier"
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
F 2 "Diode_SMD:D_SOD-323_HandSoldering" V 7700 2800 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/258/MMXZ5223B-MMXZ5259B(SOD-323)-V1-1626475.pdf" V 7700 2800 50  0001 C CNN
F 4 "" H 7700 2800 50  0001 C CNN "Part"
F 5 "833-MMXZ5226B-TP " H 7700 2800 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7700 2800 50  0001 C CNN "Supplier"
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
$EndSCHEMATC
