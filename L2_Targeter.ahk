#SingleInstance force
#Persistent
#MaxThreadsPerHotkey, 2

#include <AutoHotInterception>
#Include Lib\Utils.ahk

global AHI := new AutoHotInterception()
global KB := AHI.GetKeyboardIDFromHandle("HID\VID_2516&PID_0011&REV_0109&MI_00")
global MS := AHI.GetMouseIDFromHandle("HID\VID_1AF3&PID_0001&REV_0001")
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
;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTIONS


SetTargetHealthBarPos()
{
	MouseGetPos,mouseX,mouseY
	PixelSearch, cX, cY, mouseX-5, mouseY-5, mouseX+5, mouseY+5, healthyColor.hex, 1, Fast
	if(ErrorLevel == 0)
	{
		targetHealthPos:= new Vec2(cX,cY)
		ToolTip,% "Target health bar set at [" targetHealthPos.x ", " targetHealthPos.y "]"
	}
	else{
		ToolTip,% "Could not find a health bar near [" mouseX ", " mouseY "]"
	}
	Sleep 1000
	ToolTip
}

IsTargetAlive()
{
	c := GetPixelRGB(targetHealthPos.x, targetHealthPos.y)
	if(c.Equals(healthyColor))
	{
		return 1
	}
	else if(c.Equals(unhealthyColor,5))
	{
		return 0
	}
	
	return -1
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If CM.IsActive and WinActive("Lineage II")

*~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		global shouldPick:=False
		Gosub, Farm
	}
return

^.::
	SetTargetHealthBarPos()
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SUBS

Farm:
{
	if(not GetKeyState("CapsLock", "T"))
	{
		return
	}
	if(IsTargetAlive()==1)
	{
		shouldPick:=True
		ToolTip, attacking
		SendKey(attackButton)
		Sleep, 100
		SendKey("F9")
		Sleep, 100
		SendKey("4")
		Sleep, 100
	}
	else if(IsTargetAlive()==0)
	{
		if(shouldPick)
		{
			Loop,25
			{
				ToolTip, picking
				SendKey(pickButton)
				Sleep, 100
			}
			shouldPick:=false
		}

		ToolTip, next targeting
		SendKey(nextTargetButton)
		Sleep, 100
	}
	else
	{
		ToolTip, targeting
		SendKey(targetButton)
		Sleep, 100
	}

	SetTimer, , -100
	ToolTip
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;