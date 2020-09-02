# Information on compiling and flashing on gnu/linux distributions

1. Required tools: avr-gcc toolchain, avrdude, make
2. The paths to the avr-gcc executables must be updated according to your system
3. compile with "make all" in this subdirectory
4. flash the microcontroller by copying the generated .hex file to the production folder (fgccs-ctrl22/production) and running one of the upload scripts (either upload-wire or upload-telnet, depending on whether the ESP32-Module is installed and configured for telnet access)
5. The above scripts only work once the optiboot bootloader has been flashed onto the controller. This can be done under linux, but is currently untested. Please use a Windows 10 installation or VM to flash the bootloader via Atmel Studio 7.0 with a compatible programmer (e.g. Atmel-ICE).

