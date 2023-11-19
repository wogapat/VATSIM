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