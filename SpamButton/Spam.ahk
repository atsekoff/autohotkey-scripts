#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("World of Warcraft") and GetKeyState("CapsLock", "T")

*1::
Spam(1)
Return

*2::
Spam(2)
Return

*3::
Spam(3)
Return

*4::
Spam(4)
Return

Spam(Key)
{
    while(GetKeyState(Key, "P"))
    {
        Send %Key%
        Sleep 50
    }
    return
}