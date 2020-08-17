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
  <GND * 1 160 440 0 0 0 0>
  <R R2 1 410 150 15 -26 0 1 "1k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R1 1 330 200 -26 15 0 0 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.DC DC1 1 660 350 0 39 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <GND * 1 510 270 0 0 0 0>
  <R R3 1 510 230 15 -26 0 1 "680" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
</Components>
<Wires>
  <150 200 300 200 "" 0 0 0 "">
  <410 180 410 200 "" 0 0 0 "">
  <360 200 410 200 "" 0 0 0 "">
  <410 90 410 120 "" 0 0 0 "">
  <410 200 510 200 "" 0 0 0 "">
  <510 260 510 270 "" 0 0 0 "">
  <160 380 160 380 "VDD" 190 350 0 "">
  <150 200 150 200 "pp_in" 180 170 0 "">
  <410 90 410 90 "VDD" 440 60 0 "">
</Wires>
<Diagrams>
  <Tab 530 690 300 200 3 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 1 315 0 225 "" "" "">
	<"pp_in.V" #0000ff 0 3 1 0 0>
	<"VDD.V" #0000ff 0 3 1 0 0>
  </Tab>
</Diagrams>
<Paintings>
</Paintings>
