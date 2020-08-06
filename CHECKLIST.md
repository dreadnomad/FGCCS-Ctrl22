# CHECKLIST

- LED circuit [x]
- Button interrupt [ ]
	-> Interrupts not working
- PWM output [x]
- Pilot ADC input [x]
- CT ADC input [ ]
	-> ADC working, but untested with actual current...
- Signal relay [x]
	-> only top of pwm waveform is cut off...maybe look at different ssr?
- Temperature Sensor [ ]
	Conversion works, but value is way off...
- Power SSR [ ]
- RS485 [ ]
- Charger Lock [ ]
	Truth Table:
	-> R = 0, W = 1 :: Unlock
	-> R = 1, W = 0 :: Lock
	-> R = W = 1 :: Off
	-> B = 1 :: Locked
	-> B = 0 :: Unlocked
	
	Half working....output pins damaged? -> U8 replaced, unlock works, lock doesn't
- UART command interpreter [x]
	-> working with hardcoded cmd & param table
- Timers [ ]
	-> Interrupts not working