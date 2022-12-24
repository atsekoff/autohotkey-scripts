#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

DELAY = 100

#IfWinActive Dota 2
$!r::
    SetTimer, SpamUlt, -%DELAY%
return



SpamUlt:
    if GetKeyState("r", "P")
    {
        Send r
        SetTimer, SpamUlt, -%DELAY%
    }
return
