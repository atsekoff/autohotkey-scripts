#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive Apex Legends


IsFullAuto()
{
	;BGR
	PixelGetColor, c, 1704, 1001
	return c=0xFFFFFF
}


*~LButton up::
	SetTimer, FullAuto, Off
return

FullAuto:
	send j
	
	if(not GetKeyState("LButton", "P"))
	{
		SetTimer, FullAuto, Off
	}
Return

#If WinActive("Apex Legends")
*~LButton::
	if(IsFullAuto())
	{
		send {LButton up}
		SetTimer, FullAuto, 30
	}
return


