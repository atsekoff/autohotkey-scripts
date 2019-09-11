#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


global img := EnterWorld.png
global dcCount := 0

#If WinActive("World of Warcraft")
MsgBox, Toggle On/Off with ScrollLock

*~ScrollLock::
	dcCount := 0
	SetTimer, AutoConnect, 5000
	ToolTip Scanning for EnterWorld...,0,0
return

AutoConnect:
	if(not GetKeyState("ScrollLock", "T"))
	{
		ToolTip
		SetTimer, AutoConnect, Off
		Return
	}

	ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, *15 EnterWorld.png
	if (ErrorLevel = 2)
		ToolTip Could not conduct the search.
	else if (ErrorLevel = 1)
	{

	}
	else
	{
		dcCount := dcCount + 1
		ToolTip #%dcCount% Entered world at %A_Hour%:%A_Min%
		Click, %FoundX%, %FoundY%
		Sleep 50
		MouseMove, 900, 500
	}
	
Return


