<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,1254,1473,1,0,0>
  <Grid=10,10,1>
  <DataSet=button_simulation_no_div.dat>
  <DataDisplay=button_simulation_no_div.dpl>
  <OpenDisplay=1>
  <Script=button_simulation_no_div.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 580 410 0 0 0 0>
  <GND * 1 460 410 0 0 0 0>
  <.TR TR1 1 90 270 0 67 0 0 "lin" 1 "0" 1 "1 ms" 1 "11" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <GND * 1 370 270 0 0 0 0>
  <Vdc V1 1 460 380 18 -26 0 1 "12V" 1>
  <Vdc V2 1 580 380 18 -26 0 1 "3.3V" 1>
  <R R1 1 440 150 15 -26 0 1 "1k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Lib D2 1 370 140 -38 4 0 3 "Z-Diodes" 0 "1N4728A" 0>
  <Lib D3 1 370 240 -38 4 0 3 "Z-Diodes" 0 "1N4728A" 0>
</Components>
<Wires>
  <440 110 460 110 "" 0 0 0 "">
  <370 170 370 200 "" 0 0 0 "">
  <440 200 440 210 "" 0 0 0 "">
  <370 200 440 200 "" 0 0 0 "">
  <290 200 370 200 "" 0 0 0 "">
  <370 200 370 210 "" 0 0 0 "">
  <440 110 440 120 "" 0 0 0 "">
  <440 180 440 200 "" 0 0 0 "">
  <460 110 460 110 "vbutton" 490 80 0 "">
  <290 200 290 200 "mcu_in" 220 160 0 "">
  <460 350 460 350 "vbutton" 490 320 0 "">
  <580 350 580 350 "VDD" 610 320 0 "">
  <370 110 370 110 "VDD" 400 80 0 "">
</Wires>
<Diagrams>
  <Rect 200 915 585 425 3 #c0c0c0 1 00 1 0 0.0001 0.001 0 0 1 12.5 1 -1 0.2 1 315 0 225 "Zeit [s]" "" "">
	<"mcu_in.Vt" #0000ff 0 3 0 0 0>
	  <Mkr 0.0003 216 -198 3 0 0>
	<"vbutton.Vt" #ff0000 0 3 0 0 0>
	  <Mkr 0.0003 226 -368 3 0 0>
  </Rect>
</Diagrams>
<Paintings>
  <Text 111 747 12 #000000 90 "Spannung [V]">
</Paintings>
