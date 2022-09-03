#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

global wowid
WinGet, wowid, List, World of Warcraft

SendToAll(Key)
{
  loop, %wowid%
  {	
    id := wowid%A_Index%
    ControlSend,, %Key%, ahk_id %id%
  }

  Return
}

~NumLock::
  ToolTip Spamming 9, 500, 500
  while(GetKeyState("NumLock", "T"))
  {
    Random, zzz, 25, 111
    SendToAll("{9}")
    sleep zzz
  }
  Reload
Return