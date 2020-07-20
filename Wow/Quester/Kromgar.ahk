#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Run, -200
		; ToolTip
	}
	Else
	{
		Reload
	}
return




; MAIN LOOP :

Run:
	ToolTip StarTED
	Sleep 500
	
	Send {F1}
	Sleep 1000
	Send {Alt Down}{Tab}{Alt Up}
	Sleep 1000
	Send {F1}
	Sleep 1000
	Send {F2}
	Sleep 1000
	Send {Alt Down}{Tab}{Alt Up}
	Sleep 1000
	
	Send {F5}
	Sleep 100
	Send {A Down}
	Loop, 5
	{
		Send \;
		Sleep 600
	}
	Send {A Up}
	Sleep 100
	Send {D Down}
	Loop, 5
	{
		Send \;
		Sleep 600
	}
	Send {D Up}
	Sleep 100
	Send {F4}
	Sleep 1000
	Send {F2}
	Sleep 1000
	
	Send {F1}
	Sleep 1000
	Send {Alt Down}{Tab}{Alt Up}
	Sleep 1000
	Send {F1}
	Sleep 1000
	Send {F2}
	Sleep 1000
	Send {Alt Down}{Tab}{Alt Up}
	Sleep 1000
	
	Send {F3}
	Sleep 1000
	Send {F2}
	
	Sleep 14000
	Send {Enter}
	Sleep 7000
	
	
	
	
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Run, -200
		return
		; ToolTip
	}
Return