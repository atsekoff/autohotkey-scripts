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
	
	Send {A Down}
	Loop, 5
	{
		Send \;
		Sleep 300
	}
	Send {A Up}
	Sleep 100
	
	Send {D Down}
	Loop, 5
	{
		Send \;
		Sleep 300
	}
	Send {D Up}
	Sleep 100
	
	Send {F4}
	Sleep 1000
	Send {F2}
	Sleep 1000
	
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	SendToAll("{F5}")
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