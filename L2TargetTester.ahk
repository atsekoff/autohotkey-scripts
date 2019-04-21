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

global attackButton:="1"
global pickButton:="F4"
global nextTargetButton:="2"
global targetButton:="-"

global target := new L2Target
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
		global shouldPick:=False
		Thread, Interrupt, 0
		SetTimer, Farm, -1
	}
	else{
		SetTimer, Farm, Delete
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
		SendKey("F9")
		Chill()
		SendKey("4")
		Chill()
		SendKey(attackButton)
		Chill()
	}
	else if(alive==0)
	{
		ToolTip, nexttargeting, 500, 1000
		SendKey(nextTargetButton)
		Chill()

		if(shouldPick)
		{
			Loop,10
			{
				ToolTip, picking, 500, 1000
				SendKey(pickButton)
				Sleep 200
			}
			shouldPick:=false
		}
	}
	else
	{
		ToolTip, targeting, 500, 1000
		SendKey(targetButton)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;