# TODO

This is the TODO list for ba-atmevse

## Current TODOs

- [ ] Test subcircuits on breadboard: 12V Button/LED, CT inputs, Reed Relay
- [ ] Get parts list and corresponding footprints, preferably one supplier for everything -> see PARTS.md for details 
- [ ] Draft first layout 
- [ ] Setup Linux AVR toolchain and IDE
- [x] Test Serial Comms to PC -> Working!

## First Steps

- [x] Analyse the SmartEVSE circuit
- [ ] Analyse the SmartEVSE code
    - [x] Cross-reference code and schematic
    - [ ] Analyse code in detail
- [x] Determine necessary changes to fulfill requirements
    - [x] Propose ATmega4808 pin config -> see PINCFG.md
    - [x] Redraw schematic to determine necessary revisions
- [x] If necessary, clarify requirements
    - [x] First clarification received
    - [x] Get feedback on first draft
- [x] Find possible conflicts due to changes
- [x] Resolve conflicts and devise a rough roadmap
- [ ] First layout draft
- [ ] Document all steps taken
    - [x] REVENG.md documents the circuit analysis of SmartEVSEv2.2
    - [x] PINCFG.md documents the chosen pin layout for the ATmega4808 MCU
    - [ ] Set up TeXStudio project for the actual writing    

## Questions

- [x] ESP32 Firmware and Comms protocol? SPI, I2C, ...?
- [x] How many SSRs/Contactors? 1-phase & 3-phase or 3x 1-phase?
- [ ] How to set up the current transformer inputs? RMS value calculation in Software or rectified input to ADC?
- [x] Button input with or w/o voltage divider? If no div, BAT54 schottky diode limits mcu input voltage to ~3.8V
      If with div, mcu input voltage is at ~3.27V -> Tests? Max input on ATmega ADC? -> see simulation files for details
      -> voltage divider & zener diode for stabilisation in rev0.6 schematic


## Main System Components

- ATmega4808 firmware
- circuit design
    - ATmega pin layout
    - ESP32 module
    - Debug and programming interface (Serial, UDPI, ...)
- PCB layout
- test cases and verification
- prototyping
- documentation

