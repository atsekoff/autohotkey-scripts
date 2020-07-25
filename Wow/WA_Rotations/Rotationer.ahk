#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


global CHECK_RATE_MS := 100
global ICON_SIZE := 32
global SKILL_COUNT := 6
global POS_X := 16
global POS_Y := 1064


GetPos()
{
	MouseGetPos, POS_X, POS_Y
	MsgBox, New pos = X:%POS_X% Y:%POS_Y%
	
	return
}


CheckColor()
{
	MouseGetPos, x, y
	PixelGetColor, c, %g%, %y%
	MsgBox, %c%
	
	return
}

GetSkillIndex()
{
	x := POS_X
	
	Loop, %SKILL_COUNT%
	{
		; ToolTip, asdasd
		x := POS_X + ICON_SIZE * (A_Index - 1)
		PixelGetColor, color, %x%, %POS_Y%
		; y := POS_Y + 10
		; ToolTip, color for index %A_Index% at X:%x% Y:%POS_Y% is %color%, %x%, %y%
		; Sleep, 400
		
		if(color = 0x000000)
		{
			return A_Index
		}
	}
	
	return 
}




#If WinActive("World of Warcraft")

^o::
	CheckColor()
return

^i::
	GetPos()
return

*~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, RunRotation, -%CHECK_RATE_MS%
	}
return



RunRotation:
	skillIndex := GetSkillIndex()
	key := "Numpad" . skillIndex
	;ToolTip, %key%, 555, 555
	Send {%key%}
	;ToolTip, %skillIndex%, 555, 555
	
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, RunRotation, -%CHECK_RATE_MS%
		; ToolTip
	}
Return


