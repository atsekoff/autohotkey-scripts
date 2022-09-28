#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

global relogMinutes = 5
global tooltipX = A_ScreenWidth/2
global tooltipY = A_ScreenHeight*0.20

global wowid
WinGet, wowid, List, World of Warcraft

ToolTip, Create a macro '/logout' and put it on keybind '9'`nStart/Pause with Ctrl+F12, tooltipX, tooltipY

Pause

while(True)
{
  ToolTip Logging out... , tooltipX, tooltipY
  Sleep 1000
  SendToAll("{9}")
  Sleep 1000

  ToolTip Waiting %relogMinutes% minutes to relog , tooltipX, tooltipY
  relogTime := relogMinutes * 60 * 1000
  Sleep relogTime

  ToolTip Relogging..., tooltipX, tooltipY
  SendToAll("{Enter}")
  Sleep 10000
}

SendToAll(Key)
{
  loop, %wowid%
  {	
    id := wowid%A_Index%
    ControlSend,, %Key%, ahk_id %id%
  }

  Return
}

#If, A_IsPaused
  ^F12::
  ToolTip, Resuming auto relog..., tooltipX, tooltipY
  Pause
Return
#If
^F12::
ToolTip
Reload
Return