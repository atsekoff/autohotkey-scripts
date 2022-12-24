#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

global DEG_TO_RAD = 3.14159 / 180.0

F2::Pause

#IfWinActive Dota 2
!r::
    MouseGetPos, cx,cy
    MouseCircle(cx,cy,120, 210)
return

PlantMine(x,y)
{
    MouseMove, %x%, %y%, 100
    Send R
    Click
    Return
}

MouseCircle(cX,cY,deg,radius)
{
    ; rotate around center (cX, cY)
    Random, angle, 0, 360
    Loop, % 360 / deg
    {
        angle += deg
        radians := angle * DEG_TO_RAD
        dx := radius * Cos(radians)
        dy := radius * Sin(radians)
        MouseMove, cx + dx, cy + dy, 50
        Send r
        Sleep % deg
    }
    MouseMove cX,cY
    return
}
