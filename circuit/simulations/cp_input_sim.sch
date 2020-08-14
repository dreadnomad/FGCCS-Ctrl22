<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,908,1678,1,0,300>
  <Grid=10,10,1>
  <DataSet=cp_input_sim.dat>
  <DataDisplay=cp_input_sim.dpl>
  <OpenDisplay=1>
  <Script=cp_input_sim.m>
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
  <.TR TR1 1 150 590 0 63 0 0 "lin" 1 "0" 1 "2ms" 1 "2001" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
  <OpAmp OP1 1 400 400 -26 42 1 2 "1e6" 1 "15 V" 0>
  <GND * 1 610 520 0 0 1 2>
  <GND * 1 170 520 0 0 1 2>
  <R R1 1 230 400 -26 15 1 2 "40.2k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R2 1 170 480 -62 -26 1 1 "15k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vrect V1 1 610 450 -92 -26 1 1 "12V" 1 "500us" 1 "500us" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
</Components>
<Wires>
  <430 420 490 420 "" 0 0 0 "">
  <490 420 490 500 "" 0 0 0 "">
  <340 500 490 500 "" 0 0 0 "">
  <340 400 340 500 "" 0 0 0 "">
  <340 400 360 400 "" 0 0 0 "">
  <260 400 340 400 "" 0 0 0 "">
  <430 380 610 380 "" 0 0 0 "">
  <610 380 610 420 "" 0 0 0 "">
  <610 480 610 520 "" 0 0 0 "">
  <170 400 200 400 "" 0 0 0 "">
  <170 400 170 450 "" 0 0 0 "">
  <170 510 170 520 "" 0 0 0 "">
  <610 380 610 380 "in" 580 350 0 "">
  <170 400 170 400 "out" 140 370 0 "">
</Wires>
<Diagrams>
  <Rect 320 906 518 326 3 #c0c0c0 1 00 1 0 0.0002 0.002 0 -0.3 1 13 1 -1 0.5 1 315 0 225 "Zeit [s]" "Ausgangsspannung [V]" "">
	<"out.Vt" #0055ff 0 3 0 0 0>
	  <Mkr 0.0004 144 -167 3 0 0>
  </Rect>
  <Rect 320 1281 521 321 3 #c0c0c0 1 00 1 0 0.0002 0.002 0 -0.3 2 13 1 -1 0.5 1 315 0 225 "Zeit [s]" "Eingangsspannung  [V]" "">
	<"in.Vt" #ff0000 0 3 0 0 0>
	  <Mkr 0.000371 147 -277 3 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
