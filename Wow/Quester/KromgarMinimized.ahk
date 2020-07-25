global wowid
global count := 0

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
	count := count + 1
	ToolTip count: %count%
	Sleep 500
	
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F1}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	SendToAll("{F5}")
	Sleep 1000
	
	SendToAll("{D Down}")
	Loop, 9
	{
		SendToAll(";")
		Sleep 200
	}
	SendToAll("{D Up}")
	Sleep 100
	
	SendToAll("{A Down}")
	Loop, 9
	{
		SendToAll(";")
		Sleep 200
	}
	SendToAll("{A Up}")
	Sleep 100
	
	SendToAll("{F4}")
	Sleep 1000
	SendToAll("{F2}")
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
	
	SendToAll("{F3}")
	Sleep 500
	SendToAll("{F2}")
	Sleep 500
	
	if(count = 100)
	{
		Reload
	}
	
	Sleep 14422
	SendToAll("{Enter}")
	Sleep 500
	SendToAll("{Enter}")
	Sleep 7000
	
	
	
	
	; if(GetKeyState("CapsLock", "T"))
	; {
		SetTimer, Run, -200
	; }
Return