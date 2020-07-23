global wowid

WinGet, wowid, List, ahk_exe wow.exe


SendToAll(Key)
{
	loop, %wowid%
	{	
		id := wowid%A_Index%
		ControlSend,, %Key%, ahk_id %id%
	}

	Return
}

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
	
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	
	Send {D Down}
	Loop, 9
	{
		Send \;
		Sleep 200
	}
	Send {D Up}
	Sleep 100
	
	Send {A Down}
	Loop, 9
	{
		Send \;
		Sleep 200
	}
	Send {A Up}
	Sleep 100
	
	Send {F4}
	Sleep 1000
	Send {F2}
	Sleep 1000
	
	SendToAll("{F1}")
	Sleep 500
	SendToAll("{F1}")
	Sleep 500
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	
	Send {F3}
	Sleep 500
	Send {F2}
	Sleep 500
	
	Sleep 14422
	Send {Enter}
	Sleep 7000
	
	
	
	
	; if(GetKeyState("CapsLock", "T"))
	; {
		SetTimer, Run, -200
	; }
Return