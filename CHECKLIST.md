# CHECKLIST

- LED circuit [x]
- Button interrupt [ ]
- PWM output [x]
- Pilot ADC input [x]
- CT ADC input [ ]
- Signal relay [x]
	-> only top of pwm waveform is cut off...maybe look at different ssr?
- Power SSR [ ]
- RS485 [ ]
- Charger Lock [ ]
	Truth Table:
	-> R = 0, W = 1 :: Unlock
	-> R = 1, W = 0 :: Lock
	-> R = W = 1 :: Off
	-> B = 1 :: Locked
	-> B = 0 :: Unlocked
	
	Half working....output pins damaged?
- UART command interpreter [x]
	-> working with hardcoded cmd & param table