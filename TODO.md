# TODO

This is the TODO list for ba-atmevse

## First Steps

- [x] Analyse the SmartEVSE circuit
- [ ] Analyse the SmartEVSE code
    - [x] Cross-reference code and schematic
    - [ ] Analyse code in detail
- [ ] Determine necessary changes to fulfill requirements
    - [x] Propose ATmega4808 pin config -> see PINCFG.md
    - [ ] Redraw schematic to determine necessary revisions
- [ ] If necessary, clarify requirements
    - [x] First clarification received
    - [ ] Get feedback on first draft
- [ ] Find possible conflicts due to changes
- [ ] Resolve conflicts and devise a rough roadmap
- [ ] Document all steps taken
    - [x] REVENG.md documents the circuit analysis of SmartEVSEv2.2
    - [ ] Set up TeXStudio project for the actual writing

## Questions

- [x] ESP32 Firmware and Comms protocol? SPI, I2C, ...?
- [x] How many SSRs/Contactors? 1-phase & 3-phase or 3x 1-phase?
- [ ] How to set up the current transformer inputs? RMS value calculation in Software or rectified input to ADC?
- [ ] Button input with or w/o voltage divider? If no div, BAT54 schottky diode limits mcu input voltage to ~3.8V
      If with div, mcu input voltage is at ~3.27V -> Tests? Max input on ATmega ADC? -> see simulation files for details


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

