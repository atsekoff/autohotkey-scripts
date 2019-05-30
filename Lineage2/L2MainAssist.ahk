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

global KEY_ATTACK:="F1"
global KEY_NEXT:="F2"
global KEY_TARGET:="F3"
global KEY_PICK:="F4"
global KEY_SKILL:="F5"
global KEY_BUFF:="F6"

global target := new L2Target
;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTIONS

Chill()
{
	Sleep 200
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If CM.IsActive and WinActive("Lineage II")

*~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		global shouldPick:=False
		Thread, Interrupt, 0
		SetTimer, Farm, -1
		SetTimer, CancelTarget, 15000
	}
	else{
		SetTimer, Farm, Delete
		SetTimer, CancelTarget, Delete
		ToolTip
	}
return

^.::
	target.SetTargetHealthBarPos()
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SUBS

Farm:
{
	alive:= target.IsAlive()
	if(alive==1)
	{
		shouldPick:=True
		ToolTip, attacking, 500, 1000
		SendKey("F6")
		Sleep 1000
		SendKey(KEY_SKILL)
		Sleep 1000
		SendKey(KEY_ATTACK)
	}
	else if(alive==0)
	{
		ToolTip, nexttargeting, 500, 1000
		SendKey(KEY_NEXT)
		Chill()

		if(shouldPick)
		{
			Loop,10
			{
				ToolTip, picking, 500, 1000
				SendKey(KEY_PICK)
				Sleep 200
			}
			shouldPick:=false
		}
	}
	else
	{
		ToolTip, targeting, 500, 1000
		SendKey(KEY_TARGET)
		Chill()
	}

	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Farm, -500
	}
	else{
		ToolTip
	}
	return
}

CancelTarget:
{
	if(not GetKeyState("CapsLock", "T"))
	{
		SetTimer,, Off
	}
	SendKey("Esc")
	return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;