#SingleInstance force
;#Persistent
#MaxThreadsPerHotkey, 2

#include <AutoHotInterception>
#Include Lib\Utils.ahk
#include Lib\HWIDs.ahk
#include Lib\L2Target.ahk

global AHI := new AutoHotInterception()
global KB := AHI.GetKeyboardIDFromHandle(BATMAN_KB_ID)
global MS := AHI.GetMouseIDFromHandle(BATMAN_MS_ID)
global CM := AHI.CreateContextManager(KB)
SendKey(key)
{
    sc := GetKeySC(key)
    AHI.SendKeyEvent(KB, sc, 1)
    AHI.SendKeyEvent(KB, sc, 0)
	return
}

global hpThresh:= 70
global targetHealthPos:= new Vec2(0,0)
global healthyColor:= new RGB(135,29,24,0x181D87)
global unhealthyColor:= new RGB(55,30,28,0x1C1E37)
global target := new L2Target

global KEY_ATTACK:="F1"
global KEY_NEXT:="F2"
global KEY_TARGET:="F3"
global KEY_PICK:="F4"
global KEY_SKILL:="F5"
global KEY_BUFF:="F6"

;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTIONS

Chill()
{
	Sleep 10
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If CM.IsActive and WinActive("Lineage II")

*~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		Thread, Interrupt, 0
		SetTimer, Bard, -1
	}
	else
	{
		SetTimer, Bard, Delete
		SetTimer, Assist, Delete
		ToolTip
	}
return

^.::
	target.SetTargetHealthBarPos()
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SUBS

Assist:
{
	alive:= target.IsAlive()
	if(alive==1)
	{
		ToolTip, % "Attacking..." , 500, 1000
		Chill()
		SendKey(KEY_TARGET)
		Chill()
	}
	else
	{
		ToolTip, % "Assisting..." , 500, 1000
		SendKey(KEY_TARGET)
		Chill()
	}

	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Assist, -500
	}
	else
	{
		ToolTip
	}
	return
}

Bard:
{
	ToolTip, % "Disco", 500,1000
	SetTimer, Assist, Off
	Sleep 500
	SendKey(KEY_BUFF)
	Sleep 7000
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Assist, -500
		SetTimer, Bard, -120000
	}
	ToolTip
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;