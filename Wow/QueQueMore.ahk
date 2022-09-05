#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

global relogMinutes = 5

global wowid
WinGet, wowid, List, World of Warcraft

MsgBox, , Auto-relog to avoid queue, Create a macro '/logout' and put it on keybind '9'`nStart/Pause with NumLock, 15

Pause

while(True)
{
  ToolTip Relogging every %relogMinutes% minutes , A_ScreenWidth/2, A_ScreenHeight*0.15
  Loop,5
  {
    SendToAll("{9}")
    Sleep 1000
  }

  relogTime := relogMinutes * 60 * 1000
  Sleep relogTime

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
  ~NumLock::
  Pause
Return
#If
~NumLock::
ToolTip
Pause
Return