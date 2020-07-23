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
	Sleep 500
	SendToAll("{F1}")
	Sleep 2000
	SendToAll("{F5}")
	Sleep 750
	SendToAll("{F6}")
	Sleep 750
	SendToAll("{F7}")
	Sleep 750
	SendToAll("{F8}")
	Sleep 750
	SendToAll("{F9}")
	Sleep 750
	SendToAll("{F10}")
	Sleep 750
	
	Send {F4}
	Sleep 1000
	
	Send \;
	Sleep 4000
	
	Send {F2}
	Sleep 1000
	
	SendToAll("{F1}")
	Sleep 500
	SendToAll("{F1}")
	Sleep 2000
	SendToAll("{F5}")
	Sleep 750
	SendToAll("{F6}")
	Sleep 750
	SendToAll("{F7}")
	Sleep 750
	SendToAll("{F8}")
	Sleep 750
	SendToAll("{F9}")
	Sleep 750
	SendToAll("{F10}")
	Sleep 1000
	
	Send {F3}
	Sleep 1000
	Send {F2}
	Sleep 500
	
	Sleep 8666
	if(count = 85)
	{
		Reload
	}
	Send {Enter}
	Sleep 7000
	
	
	
	
	; if(GetKeyState("CapsLock", "T"))
	; {
		SetTimer, Run, -200
	; }
Return