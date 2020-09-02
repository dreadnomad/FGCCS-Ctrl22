# Notes on compiling fgccs-firmware

1. In order to use the optiboot bootloader, the following settings are critical:
    - Set the BOOTEND fuse of the ATmega4808 to 0x02 (Optiboot size is 512 bytes, 2x256bytes)
    - In the linker memory settings, add the entry ".text=0x100" to set the application section after the bootloader in flash
2. The firmware was written with testing the hardware in mind, it is NOT production ready! The "production" build is called that because it aims to enable testing of the production behaviour of the system and it can actually charge an EV.
3. In main.h there are two #defines: TESTING and PRODUCTION. Commenting out one or the other results in either a TESTING or PRODUCTION build. TESTING consists of a simple loop with uart readline, it is designed for testing functions via the serial command line (cmd module).
