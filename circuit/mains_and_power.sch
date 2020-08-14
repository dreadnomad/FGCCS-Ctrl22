EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "FGCCS-Ctrl22"
Date "2020-08-11"
Rev "1.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L smartevse:Varistor RV3
U 1 1 5E9A9653
P 3300 2050
F 0 "RV3" H 3403 2096 50  0000 L CNN
F 1 "Varistor" H 3403 2005 50  0000 L CNN
F 2 "Varistor:RV_Disc_D15.5mm_W5mm_P7.5mm" V 3230 2050 50  0001 C CNN
F 3 "https://www.tdk-electronics.tdk.com/inf/70/db/var/SIOV_Leaded_StandarD.pdf" H 3300 2050 50  0001 C CNN
F 4 "" H 3300 2050 50  0001 C CNN "Part"
F 5 "871-B72214S0271K551" H 3300 2050 50  0001 C CNN "PartNo"
F 6 "Mouser" H 3300 2050 50  0001 C CNN "Supplier"
	1    3300 2050
	1    0    0    -1  
$EndComp
$Comp
L smartevse:Varistor RV2
U 1 1 5E9A9659
P 3200 2350
F 0 "RV2" H 3303 2396 50  0000 L CNN
F 1 "Varistor" H 3303 2305 50  0000 L CNN
F 2 "Varistor:RV_Disc_D15.5mm_W5mm_P7.5mm" V 3130 2350 50  0001 C CNN
F 3 "https://www.tdk-electronics.tdk.com/inf/70/db/var/SIOV_Leaded_StandarD.pdf" H 3200 2350 50  0001 C CNN
F 4 "" H 3200 2350 50  0001 C CNN "Part"
F 5 "871-B72214S0271K551" H 3200 2350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 3200 2350 50  0001 C CNN "Supplier"
	1    3200 2350
	1    0    0    -1  
$EndComp
$Comp
L smartevse:Varistor RV1
U 1 1 5E9A965F
P 3100 2650
F 0 "RV1" H 3203 2696 50  0000 L CNN
F 1 "Varistor" H 3203 2605 50  0000 L CNN
F 2 "Varistor:RV_Disc_D15.5mm_W5mm_P7.5mm" V 3030 2650 50  0001 C CNN
F 3 "https://www.tdk-electronics.tdk.com/inf/70/db/var/SIOV_Leaded_StandarD.pdf" H 3100 2650 50  0001 C CNN
F 4 "" H 3100 2650 50  0001 C CNN "Part"
F 5 "871-B72214S0271K551" H 3100 2650 50  0001 C CNN "PartNo"
F 6 "Mouser" H 3100 2650 50  0001 C CNN "Supplier"
	1    3100 2650
	1    0    0    -1  
$EndComp
$Comp
L smartevse:AQH3223 U3
U 1 1 5E9A9676
P 5200 3800
F 0 "U3" H 5200 3290 70  0000 C CNN
F 1 "AQH3223" H 5200 3411 70  0000 C CNN
F 2 "smartevse-footprints:DIL07SMD" H 5200 3800 50  0001 C CNN
F 3 "" H 5200 3800 50  0001 C CNN
F 4 "" H 5200 3800 50  0001 C CNN "Part"
F 5 "769-AQH1213AX" H 5200 3800 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5200 3800 50  0001 C CNN "Supplier"
	1    5200 3800
	-1   0    0    1   
$EndComp
$Comp
L smartevse:AQH3223 U2
U 1 1 5E9A967C
P 5200 2800
F 0 "U2" H 5200 2290 70  0000 C CNN
F 1 "AQH3223" H 5200 2411 70  0000 C CNN
F 2 "smartevse-footprints:DIL07SMD" H 5200 2800 50  0001 C CNN
F 3 "" H 5200 2800 50  0001 C CNN
F 4 "" H 5200 2800 50  0001 C CNN "Part"
F 5 "769-AQH1213AX" H 5200 2800 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5200 2800 50  0001 C CNN "Supplier"
	1    5200 2800
	-1   0    0    1   
$EndComp
$Comp
L smartevse:AQH3223 U1
U 1 1 5E9A9682
P 5200 1800
F 0 "U1" H 5200 1290 70  0000 C CNN
F 1 "AQH3223" H 5200 1411 70  0000 C CNN
F 2 "smartevse-footprints:DIL07SMD" H 5200 1800 50  0001 C CNN
F 3 "" H 5200 1800 50  0001 C CNN
F 4 "" H 5200 1800 50  0001 C CNN "Part"
F 5 "769-AQH1213AX" H 5200 1800 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5200 1800 50  0001 C CNN "Supplier"
	1    5200 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 1600 5800 1600
Wire Wire Line
	5800 1600 5800 1700
Wire Wire Line
	5800 1800 5700 1800
Wire Wire Line
	5700 1700 5800 1700
Connection ~ 5800 1700
Wire Wire Line
	5800 1700 5800 1800
Wire Wire Line
	5900 1700 5800 1700
$Comp
L power:GND #PWR02
U 1 1 5E9A968F
P 5900 1700
F 0 "#PWR02" H 5900 1450 50  0001 C CNN
F 1 "GND" H 5905 1527 50  0000 C CNN
F 2 "" H 5900 1700 50  0001 C CNN
F 3 "" H 5900 1700 50  0001 C CNN
	1    5900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2600 5800 2600
Wire Wire Line
	5800 2600 5800 2700
Wire Wire Line
	5800 2800 5700 2800
Wire Wire Line
	5700 2700 5800 2700
Wire Wire Line
	5700 3600 5800 3600
Wire Wire Line
	5800 3600 5800 3700
Wire Wire Line
	5800 3800 5700 3800
Wire Wire Line
	5700 3700 5800 3700
$Comp
L power:GND #PWR03
U 1 1 5E9A969D
P 5900 2700
F 0 "#PWR03" H 5900 2450 50  0001 C CNN
F 1 "GND" H 5905 2527 50  0000 C CNN
F 2 "" H 5900 2700 50  0001 C CNN
F 3 "" H 5900 2700 50  0001 C CNN
	1    5900 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E9A96A3
P 5900 3700
F 0 "#PWR04" H 5900 3450 50  0001 C CNN
F 1 "GND" H 5905 3527 50  0000 C CNN
F 2 "" H 5900 3700 50  0001 C CNN
F 3 "" H 5900 3700 50  0001 C CNN
	1    5900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3000 5900 3000
Wire Wire Line
	5700 4000 5900 4000
Wire Wire Line
	5700 2000 5900 2000
Wire Wire Line
	4250 1800 4700 1800
NoConn ~ 4700 1600
NoConn ~ 4700 2600
NoConn ~ 4700 3600
Text Notes 4850 1000 0    50   ~ 0
Solid State Relays
Text Notes 1200 1200 0    50   ~ 0
Mains Input & Contactor Output\n
$Comp
L smartevse:MPM-05-12 U4
U 1 1 5E9A96BD
P 5200 5000
F 0 "U4" H 5200 5447 42  0000 C CNN
F 1 "MPM-05-12" H 5200 5368 42  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_MeanWell_IRM-10-xx_THT" H 5200 5000 50  0001 C CNN
F 3 "https://www.meanwell.com/webapp/product/search.aspx?prod=MPM-05" H 5200 5000 50  0001 C CNN
F 4 "" H 5200 5000 50  0001 C CNN "Part"
F 5 "709-IRM10-12" H 5200 5000 50  0001 C CNN "PartNo"
F 6 "Mouser" H 5200 5000 50  0001 C CNN "Supplier"
	1    5200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5200 4600 5200
Text Label 4700 2100 2    50   ~ 0
C_L1
Text Label 4700 3100 2    50   ~ 0
C_L2
Text Label 4700 4100 2    50   ~ 0
C_L3
Wire Wire Line
	5900 5200 5800 5200
$Comp
L power:GND #PWR06
U 1 1 5E9A96CF
P 5900 5200
F 0 "#PWR06" H 5900 4950 50  0001 C CNN
F 1 "GND" H 5905 5027 50  0000 C CNN
F 2 "" H 5900 5200 50  0001 C CNN
F 3 "" H 5900 5200 50  0001 C CNN
	1    5900 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR05
U 1 1 5E9A96D5
P 5900 4800
F 0 "#PWR05" H 5900 4650 50  0001 C CNN
F 1 "+12V" H 5915 4973 50  0000 C CNN
F 2 "" H 5900 4800 50  0001 C CNN
F 3 "" H 5900 4800 50  0001 C CNN
	1    5900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4800 5800 4800
Text Notes 5550 5550 2    50   ~ 0
12V Power Supply
$Comp
L Device:C_Small C1
U 1 1 5E9A96DD
P 6700 1850
F 0 "C1" H 6815 1896 50  0000 L CNN
F 1 "10u16V" V 6850 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6738 1700 50  0001 C CNN
F 3 "~" H 6700 1850 50  0001 C CNN
F 4 "" H 6700 1850 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 6700 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 6700 1850 50  0001 C CNN "Supplier"
	1    6700 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5E9A96E3
P 7050 1850
F 0 "C3" H 7165 1896 50  0000 L CNN
F 1 "10u16V" V 7200 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7088 1700 50  0001 C CNN
F 3 "~" H 7050 1850 50  0001 C CNN
F 4 "" H 7050 1850 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 7050 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7050 1850 50  0001 C CNN "Supplier"
	1    7050 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5E9A96E9
P 7400 1850
F 0 "C5" H 7515 1896 50  0000 L CNN
F 1 "10u16V" V 7550 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7438 1700 50  0001 C CNN
F 3 "~" H 7400 1850 50  0001 C CNN
F 4 "" H 7400 1850 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 7400 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7400 1850 50  0001 C CNN "Supplier"
	1    7400 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5E9A96EF
P 7750 1850
F 0 "C6" H 7865 1896 50  0000 L CNN
F 1 "10u16V" V 7900 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7788 1700 50  0001 C CNN
F 3 "~" H 7750 1850 50  0001 C CNN
F 4 "" H 7750 1850 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 7750 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7750 1850 50  0001 C CNN "Supplier"
	1    7750 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5E9A96F5
P 8100 1850
F 0 "C7" H 8215 1896 50  0000 L CNN
F 1 "100n" V 8250 1650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8138 1700 50  0001 C CNN
F 3 "~" H 8100 1850 50  0001 C CNN
F 4 "" H 8100 1850 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 8100 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 8100 1850 50  0001 C CNN "Supplier"
	1    8100 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1550 7050 1550
Connection ~ 7750 1550
Wire Wire Line
	7750 1550 8100 1550
Connection ~ 7400 1550
Wire Wire Line
	7400 1550 7750 1550
Connection ~ 7050 1550
Wire Wire Line
	7050 1550 7400 1550
Wire Wire Line
	6700 2250 7050 2250
Wire Wire Line
	7050 2250 7400 2250
Connection ~ 7050 2250
Wire Wire Line
	7400 2250 7750 2250
Connection ~ 7400 2250
Wire Wire Line
	7750 2250 8100 2250
Connection ~ 7750 2250
Connection ~ 8100 1550
Wire Wire Line
	8900 1950 8900 2250
Wire Wire Line
	8900 2250 8100 2250
Connection ~ 8100 2250
$Comp
L Device:C_Small C9
U 1 1 5E9A9718
P 9500 1550
F 0 "C9" V 9271 1550 50  0000 C CNN
F 1 "100n" V 9362 1550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 1550 50  0001 C CNN
F 3 "~" H 9500 1550 50  0001 C CNN
F 4 "" H 9500 1550 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 9500 1550 50  0001 C CNN "PartNo"
F 6 "Mouser" H 9500 1550 50  0001 C CNN "Supplier"
	1    9500 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 1550 9300 1550
Wire Wire Line
	9300 1650 9650 1650
Wire Wire Line
	9650 1650 9650 1550
Wire Wire Line
	9650 1550 9600 1550
Wire Wire Line
	9650 1650 9650 1900
Connection ~ 9650 1650
$Comp
L Diode:PMEG4050EP D1
U 1 1 5E9A9724
P 9650 2050
F 0 "D1" V 9604 2129 50  0000 L CNN
F 1 "PMEG4010BEA" H 9300 1950 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 9650 1875 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PMEG4050EP.pdf" H 9650 2050 50  0001 C CNN
F 4 "" H 9650 2050 50  0001 C CNN "Part"
F 5 "771-PMEG4010BEA,135" H 9650 2050 50  0001 C CNN "PartNo"
F 6 "Mouser" H 9650 2050 50  0001 C CNN "Supplier"
	1    9650 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	9650 2200 9650 2250
Wire Wire Line
	9650 2250 9300 2250
Connection ~ 8900 2250
Wire Wire Line
	10150 2250 10150 2150
$Comp
L Device:R_Small R2
U 1 1 5E9A972E
P 10150 2050
F 0 "R2" H 10209 2096 50  0000 L CNN
F 1 "10k" V 10050 2000 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10150 2050 50  0001 C CNN
F 3 "~" H 10150 2050 50  0001 C CNN
F 4 "" H 10150 2050 50  0001 C CNN "Part"
F 5 "594-MCT06030C1002FP5 " H 10150 2050 50  0001 C CNN "PartNo"
F 6 "Mouser" H 10150 2050 50  0001 C CNN "Supplier"
	1    10150 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5E9A9734
P 10150 1700
F 0 "R1" H 10209 1746 50  0000 L CNN
F 1 "31.6k" V 10050 1600 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10150 1700 50  0001 C CNN
F 3 "~" H 10150 1700 50  0001 C CNN
F 4 "" H 10150 1700 50  0001 C CNN "Part"
F 5 "594-MCT06030C3162FP5" H 10150 1700 50  0001 C CNN "PartNo"
F 6 "Mouser" H 10150 1700 50  0001 C CNN "Supplier"
	1    10150 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2250 10150 2250
Connection ~ 9650 2250
$Comp
L Device:L L1
U 1 1 5E9A973D
P 9900 1550
F 0 "L1" V 10090 1550 50  0000 C CNN
F 1 "3.3u" V 9999 1550 50  0000 C CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 9900 1550 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_commercial_standard_mlf1608_en.pdf" H 9900 1550 50  0001 C CNN
F 4 "" H 9900 1550 50  0001 C CNN "Part"
F 5 "810-MLF1608A3R3J " H 9900 1550 50  0001 C CNN "PartNo"
F 6 "Mouser" H 9900 1550 50  0001 C CNN "Supplier"
	1    9900 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9750 1550 9650 1550
Connection ~ 9650 1550
Wire Wire Line
	9300 1750 9300 1850
Wire Wire Line
	9300 1850 10150 1850
Connection ~ 10150 1850
Wire Wire Line
	10150 1850 10150 1950
Wire Wire Line
	10050 1550 10150 1550
$Comp
L Device:C_Small C10
U 1 1 5E9A974E
P 10700 1850
F 0 "C10" H 10550 1950 50  0000 L CNN
F 1 "10u16V" V 10600 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10738 1700 50  0001 C CNN
F 3 "~" H 10700 1850 50  0001 C CNN
F 4 "" H 10700 1850 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 10700 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 10700 1850 50  0001 C CNN "Supplier"
	1    10700 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5E9A9754
P 11000 1850
F 0 "C11" H 10850 1950 50  0000 L CNN
F 1 "10u16V" V 10900 1550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11038 1700 50  0001 C CNN
F 3 "~" H 11000 1850 50  0001 C CNN
F 4 "" H 11000 1850 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 11000 1850 50  0001 C CNN "PartNo"
F 6 "Mouser" H 11000 1850 50  0001 C CNN "Supplier"
	1    11000 1850
	1    0    0    -1  
$EndComp
Connection ~ 10700 2250
Wire Wire Line
	10700 2250 11000 2250
Connection ~ 10700 1550
Wire Wire Line
	10700 1550 11000 1550
Wire Wire Line
	11000 1550 11000 1450
Connection ~ 11000 1550
$Comp
L power:+3.3V #PWR012
U 1 1 5E9A9760
P 11000 1450
F 0 "#PWR012" H 11000 1300 50  0001 C CNN
F 1 "+3.3V" H 11015 1623 50  0000 C CNN
F 2 "" H 11000 1450 50  0001 C CNN
F 3 "" H 11000 1450 50  0001 C CNN
	1    11000 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR08
U 1 1 5E9A9766
P 7400 1450
F 0 "#PWR08" H 7400 1300 50  0001 C CNN
F 1 "+12V" H 7415 1623 50  0000 C CNN
F 2 "" H 7400 1450 50  0001 C CNN
F 3 "" H 7400 1450 50  0001 C CNN
	1    7400 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 1450 7400 1550
Text Notes 9100 900  2    50   ~ 0
3.3V Regulator
$Comp
L smartevse:ICL7660 U5
U 1 1 5E9A976E
P 8900 4350
F 0 "U5" H 8900 4936 59  0000 C CNN
F 1 "TC7660SEOA" H 8900 4831 59  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8900 4350 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/268/21467B-1180369.pdf" H 8900 4350 50  0001 C CNN
F 4 "" H 8900 4350 50  0001 C CNN "Part"
F 5 "579-TC7660SEOA" H 8900 4350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 8900 4350 50  0001 C CNN "Supplier"
	1    8900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4050 8100 4050
$Comp
L power:+12V #PWR09
U 1 1 5E9A9775
P 8100 3650
F 0 "#PWR09" H 8100 3500 50  0001 C CNN
F 1 "+12V" H 8115 3823 50  0000 C CNN
F 2 "" H 8100 3650 50  0001 C CNN
F 3 "" H 8100 3650 50  0001 C CNN
	1    8100 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 4050 8100 3700
Wire Wire Line
	8100 3700 9500 3700
Wire Wire Line
	9500 3700 9500 4050
Wire Wire Line
	9500 4050 9400 4050
Connection ~ 8100 3700
Wire Wire Line
	8100 3700 8100 3650
$Comp
L Device:C_Small C4
U 1 1 5E9A9781
P 7850 3950
F 0 "C4" H 7965 3996 50  0000 L CNN
F 1 "100n" V 8000 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7888 3800 50  0001 C CNN
F 3 "~" H 7850 3950 50  0001 C CNN
F 4 "" H 7850 3950 50  0001 C CNN "Part"
F 5 "963-EMF212B7104KGHT " H 7850 3950 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7850 3950 50  0001 C CNN "Supplier"
	1    7850 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5E9A9787
P 7500 4400
F 0 "C2" H 7615 4446 50  0000 L CNN
F 1 "10u16V" V 7650 4100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7538 4250 50  0001 C CNN
F 3 "~" H 7500 4400 50  0001 C CNN
F 4 "" H 7500 4400 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 7500 4400 50  0001 C CNN "PartNo"
F 6 "Mouser" H 7500 4400 50  0001 C CNN "Supplier"
	1    7500 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4250 8500 4250
Wire Wire Line
	7850 4450 8500 4450
$Comp
L Device:C_Small C8
U 1 1 5E9A9790
P 9700 4750
F 0 "C8" H 9815 4796 50  0000 L CNN
F 1 "10u16V" V 9850 4450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9738 4600 50  0001 C CNN
F 3 "~" H 9700 4750 50  0001 C CNN
F 4 "" H 9700 4750 50  0001 C CNN "Part"
F 5 "963-EMK212ABJ106MG-T" H 9700 4750 50  0001 C CNN "PartNo"
F 6 "Mouser" H 9700 4750 50  0001 C CNN "Supplier"
	1    9700 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4650 9400 4650
Wire Wire Line
	9700 4850 7850 4850
Wire Wire Line
	7850 4850 7850 4450
Connection ~ 7850 4450
Wire Wire Line
	6700 1550 6700 1750
Wire Wire Line
	6700 1950 6700 2250
Wire Wire Line
	7050 1950 7050 2250
Wire Wire Line
	7050 1550 7050 1750
Wire Wire Line
	7400 1550 7400 1750
Wire Wire Line
	7400 1950 7400 2250
Wire Wire Line
	7750 1550 7750 1750
Wire Wire Line
	7750 1950 7750 2250
Wire Wire Line
	8100 1950 8100 2250
Wire Wire Line
	8100 1550 8100 1750
Wire Wire Line
	10700 1550 10700 1750
Wire Wire Line
	11000 1550 11000 1750
Wire Wire Line
	11000 1950 11000 2250
Wire Wire Line
	10700 1950 10700 2250
Wire Wire Line
	7850 4050 7850 4450
Wire Wire Line
	7500 4500 7500 4650
Wire Wire Line
	7500 4250 7500 4300
$Comp
L power:GND #PWR011
U 1 1 5E9A97AB
P 9300 2250
F 0 "#PWR011" H 9300 2000 50  0001 C CNN
F 1 "GND" H 9305 2077 50  0000 C CNN
F 2 "" H 9300 2250 50  0001 C CNN
F 3 "" H 9300 2250 50  0001 C CNN
	1    9300 2250
	1    0    0    -1  
$EndComp
Connection ~ 9300 2250
Wire Wire Line
	9300 2250 8900 2250
$Comp
L power:GND #PWR07
U 1 1 5E9A97B3
P 7850 4850
F 0 "#PWR07" H 7850 4600 50  0001 C CNN
F 1 "GND" H 7855 4677 50  0000 C CNN
F 2 "" H 7850 4850 50  0001 C CNN
F 3 "" H 7850 4850 50  0001 C CNN
	1    7850 4850
	1    0    0    -1  
$EndComp
Connection ~ 7850 4850
Wire Wire Line
	9700 4650 9900 4650
Wire Wire Line
	9900 4650 9900 4550
Connection ~ 9700 4650
$Comp
L power:-12V #PWR010
U 1 1 5E9A97BD
P 9900 4550
F 0 "#PWR010" H 9900 4650 50  0001 C CNN
F 1 "-12V" H 9915 4723 50  0000 C CNN
F 2 "" H 9900 4550 50  0001 C CNN
F 3 "" H 9900 4550 50  0001 C CNN
	1    9900 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4650 8500 4650
NoConn ~ 9400 4250
NoConn ~ 9400 4450
Text Notes 9000 5400 2    50   ~ 0
12V Inverter\n
Wire Notes Line
	550  750  550  4100
Wire Notes Line
	550  4100 4000 4100
Wire Notes Line
	4000 4100 4000 750 
Wire Notes Line
	4000 750  550  750 
Wire Notes Line
	4050 750  4050 4250
Wire Notes Line
	4050 4250 6300 4250
Wire Notes Line
	6300 4250 6300 750 
Wire Notes Line
	6300 750  4050 750 
Wire Notes Line
	4350 4400 4350 5650
Wire Notes Line
	4350 5650 6100 5650
Wire Notes Line
	6100 5650 6100 4400
Wire Notes Line
	6100 4400 4350 4400
Wire Notes Line
	7350 3250 7350 5450
Wire Notes Line
	7350 5450 10200 5450
Wire Notes Line
	10200 5450 10200 3250
Wire Notes Line
	10200 3250 7350 3250
Wire Notes Line
	6500 750  6500 2450
Wire Notes Line
	6500 2450 11100 2450
Wire Notes Line
	11100 2450 11100 750 
Wire Notes Line
	11100 750  6500 750 
Connection ~ 5800 2700
Wire Wire Line
	5800 2700 5800 2800
Wire Wire Line
	5800 2700 5900 2700
Connection ~ 5800 3700
Wire Wire Line
	5800 3700 5800 3800
Wire Wire Line
	5800 3700 5900 3700
Text HLabel 5900 2000 2    50   Input ~ 0
SSR_L1
Text HLabel 5900 3000 2    50   Input ~ 0
SSR_L2
Text HLabel 5900 4000 2    50   Input ~ 0
SSR_L3
Wire Wire Line
	1550 1900 3300 1900
Text Label 1200 2450 0    50   ~ 0
PE
Text Label 1600 1900 0    50   ~ 0
C_L1
Wire Wire Line
	1600 2200 3200 2200
Text Label 1600 2200 0    50   ~ 0
C_L2
Wire Wire Line
	1650 2500 3100 2500
Text Label 1650 2500 0    50   ~ 0
C_L3
Text Label 1750 3150 0    50   ~ 0
N
Wire Wire Line
	3300 2200 3300 3050
Connection ~ 3300 3050
Wire Wire Line
	3300 3050 3300 3150
Wire Wire Line
	3200 2500 3200 3050
Connection ~ 3200 3050
Wire Wire Line
	3200 3050 3300 3050
Wire Wire Line
	3100 2800 3100 3050
Wire Wire Line
	3100 3050 3200 3050
$Comp
L power:GND #PWR01
U 1 1 5E9A964B
P 1300 2450
F 0 "#PWR01" H 1300 2200 50  0001 C CNN
F 1 "GND" H 1305 2277 50  0000 C CNN
F 2 "" H 1300 2450 50  0001 C CNN
F 3 "" H 1300 2450 50  0001 C CNN
	1    1300 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1100 2450 1300 2450
Wire Wire Line
	4250 3800 4700 3800
Wire Wire Line
	4250 2800 4700 2800
Connection ~ 4250 2800
Wire Wire Line
	4250 2800 4250 1800
Wire Wire Line
	4250 3800 4250 4800
Connection ~ 4250 3800
Wire Wire Line
	4250 4800 4600 4800
Wire Wire Line
	4250 2800 4250 3350
Wire Wire Line
	1100 3350 1900 3350
Connection ~ 4250 3350
Wire Wire Line
	4250 3350 4250 3800
Text Label 1700 3350 0    50   ~ 0
L
$Comp
L smartevse:FuseT1.25 F2
U 1 1 5ECD985B
P 2050 3350
F 0 "F2" V 2150 3350 50  0000 C CNN
F 1 "T1.25A" V 1944 3350 50  0000 C CNN
F 2 "smartevse-footprints:TE5" V 1980 3350 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/240/Littelfuse_Fuse_392_Datasheet.pdf-795005.pdf" H 2050 3350 50  0001 C CNN
F 4 "" H 2050 3350 50  0001 C CNN "Part"
F 5 "576-3921125000" H 2050 3350 50  0001 C CNN "PartNo"
F 6 "Mouser" H 2050 3350 50  0001 C CNN "Supplier"
	1    2050 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 3350 4250 3350
Wire Wire Line
	7850 3850 7850 3700
Wire Wire Line
	7850 3700 8100 3700
$Comp
L smartevse:AP5100 U6
U 1 1 5ED2A5D9
P 8900 1650
F 0 "U6" H 8900 2017 50  0000 C CNN
F 1 "AP5100" H 8900 1926 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 9600 1400 50  0001 C CNN
F 3 "https://www.mouser.de/datasheet/2/115/AP5100-82364.pdf" H 8650 1400 50  0001 C CNN
F 4 "Mouser" H 8900 1650 50  0001 C CNN "Supplier"
F 5 "621-AP5100WG-7" H 8900 1650 50  0001 C CNN "PartNo"
	1    8900 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1800 10150 1850
Wire Wire Line
	10150 1600 10150 1550
Wire Wire Line
	8100 1550 8200 1550
$Comp
L Device:R_Small R14
U 1 1 5ED2FD41
P 8400 1750
F 0 "R14" V 8204 1750 50  0000 C CNN
F 1 "100k" V 8295 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8400 1750 50  0001 C CNN
F 3 "~" H 8400 1750 50  0001 C CNN
F 4 "Mouser" H 8400 1750 50  0001 C CNN "Supplier"
F 5 "594-MCT06030C1003FP5 " H 8400 1750 50  0001 C CNN "PartNo"
	1    8400 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 1750 8200 1750
Wire Wire Line
	8200 1750 8200 1550
Connection ~ 8200 1550
Wire Wire Line
	8200 1550 8500 1550
Wire Wire Line
	10150 1550 10350 1550
Connection ~ 10150 1550
Wire Wire Line
	10150 2250 10700 2250
Connection ~ 10150 2250
$Comp
L Device:C_Small C26
U 1 1 5ED43B27
P 10350 1700
F 0 "C26" H 10442 1746 50  0000 L CNN
F 1 "100p" V 10450 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10350 1700 50  0001 C CNN
F 3 "~" H 10350 1700 50  0001 C CNN
F 4 "Mouser" H 10350 1700 50  0001 C CNN "Supplier"
F 5 "77-VJ0805Y101KXACBC " H 10350 1700 50  0001 C CNN "PartNo"
	1    10350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1600 10350 1550
Connection ~ 10350 1550
Wire Wire Line
	10350 1550 10700 1550
Wire Wire Line
	10350 1800 10350 1850
Wire Wire Line
	10350 1850 10150 1850
Wire Wire Line
	1100 3150 1300 3150
$Comp
L Connector:Screw_Terminal_01x05 J?
U 1 1 5F37F01F
P 900 2650
F 0 "J?" H 818 3067 50  0000 C CNN
F 1 "Screw_Terminal_01x05" H 818 2976 50  0000 C CNN
F 2 "" H 900 2650 50  0001 C CNN
F 3 "~" H 900 2650 50  0001 C CNN
	1    900  2650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x05 J?
U 1 1 5F3809ED
P 900 3150
F 0 "J?" H 900 2850 50  0000 C CNN
F 1 "Screw_Terminal_01x05" H 850 2750 50  0000 C CNN
F 2 "" H 900 3150 50  0001 C CNN
F 3 "~" H 900 3150 50  0001 C CNN
	1    900  3150
	-1   0    0    -1  
$EndComp
NoConn ~ 1100 3250
Wire Wire Line
	1300 2550 1100 2550
Wire Wire Line
	1100 2750 1300 2750
Connection ~ 1300 2750
Wire Wire Line
	1300 2750 1300 2550
Wire Wire Line
	1100 2950 1300 2950
Connection ~ 1300 2950
Wire Wire Line
	1300 2950 1300 2750
Wire Wire Line
	1300 2950 1300 3150
Connection ~ 1300 3150
Wire Wire Line
	1300 3150 3300 3150
Connection ~ 3300 3150
Wire Wire Line
	3300 3150 3300 5200
Wire Wire Line
	1550 1900 1550 2650
Wire Wire Line
	1550 2650 1100 2650
Wire Wire Line
	1600 2200 1600 2850
Wire Wire Line
	1600 2850 1100 2850
Wire Wire Line
	1650 2500 1650 3050
Wire Wire Line
	1650 3050 1100 3050
$EndSCHEMATC
