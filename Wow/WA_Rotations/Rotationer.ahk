#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

global CHECK_RATE_MS := 100
global ICON_SIZE := 50
global SKILL_COUNT := 9
global POS_X := 2480
global POS_Y := 500
global SKILL_COLOR := 0x000000

GetPos()
{
  MouseGetPos, POS_X, POS_Y
  MsgBox, New pos = X:%POS_X% Y:%POS_Y%

  return
}

CheckColor()
{
  MouseGetPos, x, y
  PixelGetColor, c, %x%, %y%
  MsgBox, %c%

  return
}

GetSkillIndex()
{
  y := POS_Y

  Loop, %SKILL_COUNT%
  {
    y := POS_Y + ICON_SIZE * (A_Index - 1)
    Tooltip, checking, POS_X, 400
    PixelGetColor, color, %POS_X%, %y%

    if(color = SKILL_COLOR)
    {
      ToolTip, %A_Index%, POS_X,y
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

*~NumLock::
  if(GetKeyState("NumLock", "T"))
  {
    SetTimer, RunRotation, -%CHECK_RATE_MS%
  }
return

RunRotation:
  skillIndex := GetSkillIndex()
  key := "Numpad" . skillIndex
  Send {Blind}{%key%}

  if(GetKeyState("NumLock", "T"))
  {
    SetTimer, RunRotation, -%CHECK_RATE_MS%
  }
  Else
  {
    ToolTip
  }
Return

