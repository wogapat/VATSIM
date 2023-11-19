; Written by Patrick Wogan (Wogapat) v1.0 19/11/2023
; This file is for AutoHotKey v2.0 
; The script reads pedal axis and creates a keyboard input based on pedal press. 
; Right pedal press > 65 then 'Pause' (break) key is pressed
; Left pedal press > 65 then 'ScrollLock' key is pressed
; To work with TeamSpeak run TS and this script in admin. You can compile to a .exe using AutoHotKey
; Joystick ID is #1. You should check your joystick number in AutoHotKey and amend appropriately.

#Requires AutoHotkey v2.0

SetTimer WatchAxis, 5

WatchAxis()
{
LeftPedalKeyPress := "ScrollLock"
RightPedalKeyPress := "Pause"

Static LeftPrev := 100
Static RightPrev := 100

	LeftPedal := GetKeyState("1JoyY")
	RightPedal := GetKeyState("1JoyX")

	;if LeftPedal = LeftPrev and RightPedal = RightPrev
	;	return


	if (LeftPedal <= 65 and LeftPrev > 65) 
		{
			SendInput "{" LeftPedalKeyPress " down}"	
		}
	
	if (LeftPedal > 65 and LeftPrev <= 65)
		{
			SendInput "{" LeftPedalKeyPress " up}"
		}


	if (RightPedal <= 65 and RightPrev > 65) 
		{
			SendInput "{" RightPedalKeyPress " down}"	
		}
	
	if (RightPedal > 65 and RightPrev <= 65)
		{
			SendInput "{" RightPedalKeyPress " up}"
		}

	RightPrev := RightPedal
	LeftPrev := LeftPedal

return
}  
