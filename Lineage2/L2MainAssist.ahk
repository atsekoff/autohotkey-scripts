#SingleInstance force
;#Persistent
#MaxThreadsPerHotkey, 2

#include ..\Lib\AutoHotInterception.ahk
#Include ..\Utils\Utils.ahk
#include ..\Lib\HWIDs.ahk
#include L2Target.ahk


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

Chill(min, max)
{
	Random, sleepTime , min, max
	tooltip %sleepTime%
	Sleep sleepTime
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
		SendKey(KEY_BUFF)
		Chill(500, 1500)
		SendKey(KEY_SKILL)
		Chill(500, 1500)
		SendKey(KEY_ATTACK)
	}
	else if(alive==0)
	{
		ToolTip, nexttargeting, 500, 1000
		SendKey(KEY_NEXT)
		Chill(50, 200)

		; if(shouldpick)
		; {
			; loop,10
			; {
				; tooltip, picking, 500, 1000
				; sendkey(key_pick)
				; sleep 200
			; }
			; shouldpick:=false
		; }
	}
	else
	{
		ToolTip, targeting, 500, 1000
		SendKey(KEY_TARGET)
		Chill(50, 200)
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