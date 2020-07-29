<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,800,908,1,0,0>
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
  <OpAmp OP1 1 380 400 -26 42 0 0 "1e6" 1 "15 V" 0>
  <GND * 1 170 520 0 0 0 0>
  <GND * 1 610 520 0 0 0 0>
  <R R1 1 550 400 -26 15 0 0 "40.2k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R2 1 610 480 15 -26 0 1 "15k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vrect V1 1 170 450 18 -26 0 1 "12V" 1 "500us" 1 "500us" 1 "1 ns" 0 "1 ns" 0 "0 ns" 0>
  <.TR TR1 1 370 730 0 63 0 0 "lin" 1 "0" 1 "2ms" 1 "11" 0 "Trapezoidal" 0 "2" 0 "1 ns" 0 "1e-16" 0 "150" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "26.85" 0 "1e-3" 0 "1e-6" 0 "1" 0 "CroutLU" 0 "no" 0 "yes" 0 "0" 0>
</Components>
<Wires>
  <290 420 350 420 "" 0 0 0 "">
  <290 420 290 500 "" 0 0 0 "">
  <290 500 440 500 "" 0 0 0 "">
  <440 400 440 500 "" 0 0 0 "">
  <420 400 440 400 "" 0 0 0 "">
  <440 400 520 400 "" 0 0 0 "">
  <170 380 350 380 "" 0 0 0 "">
  <170 380 170 420 "" 0 0 0 "">
  <170 480 170 520 "" 0 0 0 "">
  <580 400 610 400 "" 0 0 0 "">
  <610 400 610 450 "" 0 0 0 "">
  <610 510 610 520 "" 0 0 0 "">
  <610 400 610 400 "out" 640 370 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
