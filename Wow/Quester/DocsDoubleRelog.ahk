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
	ToolTip Turning in [count: %count%]
	
	Sleep 500
	
	SendToAll("{F4}")
	Sleep 500
	
	SendToAll("{F1}")
	Sleep 500
	SendToAll("{F1}")
	Sleep 3000
	
	SendToAll("{F5}")
	Sleep 400
	SendToAll("{F5}")
	
	Sleep 400
	SendToAll("{F6}")
	Sleep 400
	SendToAll("{F6}")
	
	Sleep 400
	SendToAll("{F7}")
	Sleep 400
	SendToAll("{F7}")
	
	Sleep 400
	SendToAll("{F8}")
	Sleep 400
	SendToAll("{F8}")
	
	Sleep 400
	SendToAll("{F9}")
	Sleep 400
	SendToAll("{F9}")
	
	Sleep 400
	SendToAll("{F10}")
	Sleep 400
	SendToAll("{F10}")
	Sleep 400
	
	SendToAll("{;}")
	Sleep 13000
	
	SendToAll("{Enter}")
	Sleep 500
	SendToAll("{Enter}")
	Sleep 7500
	;===========================
	
	ToolTip Abandoning [count: %count%]
	SendToAll("{F4}")
	Sleep 500
	
	SendToAll("{F1}")
	Sleep 500
	SendToAll("{F1}")
	Sleep 3000
	
	SendToAll("{F5}")
	Sleep 400
	SendToAll("{F5}")
	
	Sleep 400
	SendToAll("{F6}")
	Sleep 400
	SendToAll("{F6}")
	
	Sleep 400
	SendToAll("{F7}")
	Sleep 400
	SendToAll("{F7}")
	
	Sleep 400
	SendToAll("{F8}")
	Sleep 400
	SendToAll("{F8}")
	
	Sleep 400
	SendToAll("{F9}")
	Sleep 400
	SendToAll("{F9}")
	
	Sleep 400
	SendToAll("{F10}")
	Sleep 400
	SendToAll("{F10}")
	Sleep 400
	
	SendToAll("{F3}")
	Sleep 1000
	SendToAll("{F2}")
	Sleep 12000
	if(count = 85)
	{
		Reload
	}
	SendToAll("{Enter}")
	Sleep 500
	SendToAll("{Enter}")
	Sleep 7500
	
	
	
	
	; if(GetKeyState("CapsLock", "T"))
	; {
		SetTimer, Run, -200
	; }
Return