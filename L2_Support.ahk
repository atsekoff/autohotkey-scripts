#SingleInstance force
#Persistent
#include <AutoHotInterception>

global AHI := new AutoHotInterception()
global KB := AHI.GetKeyboardId(0x0000, 0x0000)
global MS := AHI.GetMouseId(0x22d4, 0x130c)
global CM := AHI.CreateContextManager(KB)


global hpThresh:= 70
global pt := []
global barGapY:= 46
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CLASSES

class Coord
{
	x:= 0
	y:= 0

	__New(x, y)
	{
		this.x:= x
		this.y:= y
	}
}

class BGR
{
	b:= 0
	g:= 0
	r:= 0

	__New(b,g,r)
	{
		this.b:=b
		this.g:=g
		this.r:=r
	}
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;; FUNCTIONS
SendKey(key)
{
    sc := GetKeySC(key)
    AHI.SendKeyEvent(KB, sc, 1)
    AHI.SendKeyEvent(KB, sc, 0)
	return
}

GetRed(x,y)
{
	PixelGetColor, c, %x%, %y%
	return BGR(c).r
}

CheckHealth()
{
	ToolTip
	Loop, 8
	{
		if(GetRed(pt[A_Index].x, pt[A_Index].y) < hpThresh)
		{
			keyName = F%A_Index%
			ToolTip,  Healing %A_Index%, 0, 0
			SendKey(keyName)
			Break
		}
	}
	return
}


BGR(hexBGR) 
{
	NumPut("0x" SubStr(hexBGR,-5), (V:="000000"))
	Return new BGR(NumGet(V,2,"UChar"), NumGet(V,1,"UChar"), NumGet(V,0,"UChar"))
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#If CM.IsActive and WinActive("Lineage II")

*~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Sub1, 500
		SetTimer, Sub2, 60000
	}
return



^~Numpad0::
	MouseGetPos,x,y
	Loop, 8
	{
		pt[A_Index]:= new Coord(x, y+(A_Index-1)*barGapY)
	}
	f = % pt[1].y
	l = % pt[8].y
	ToolTip, "Health bars from " %f% "to" %l%
	Sleep 1000
	ToolTip
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SUBS

Sub1:
{
	if(not GetKeyState("CapsLock", "T"))
	{
		SetTimer, Sub1, Off
	}
	CheckHealth()
	return
}

Sub2:
{
	if(not GetKeyState("CapsLock", "T"))
	{
		SetTimer, Sub2, Off
	}
	SendKey("=")
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;