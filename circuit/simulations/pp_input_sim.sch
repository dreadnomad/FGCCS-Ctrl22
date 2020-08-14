<Qucs Schematic 0.0.19>
<Properties>
  <View=0,0,850,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=pp_input_sim.dat>
  <DataDisplay=pp_input_sim.dpl>
  <OpenDisplay=0>
  <Script=pp_input_sim.m>
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
  <Vdc V1 1 160 410 18 -26 0 1 "3.3" 1>
  <Vdc V2 1 320 410 18 -26 0 1 "12" 1>
  <GND * 1 320 440 0 0 0 0>
  <GND * 1 160 440 0 0 0 0>
  <R R2 1 410 150 15 -26 0 1 "1k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R1 1 330 200 -26 15 0 0 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.DC DC1 1 660 350 0 39 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
</Components>
<Wires>
  <150 200 300 200 "" 0 0 0 "">
  <410 180 410 200 "" 0 0 0 "">
  <360 200 410 200 "" 0 0 0 "">
  <410 90 410 120 "" 0 0 0 "">
  <410 200 510 200 "" 0 0 0 "">
  <160 380 160 380 "VDD" 190 350 0 "">
  <320 380 320 380 "V12" 350 350 0 "">
  <150 200 150 200 "pp_in" 180 170 0 "">
  <410 90 410 90 "VDD" 440 60 0 "">
  <510 200 510 200 "V12" 540 170 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
