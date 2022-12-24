#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force

Pause
loop
	MoveMouseInCircle(200, 15,, 10)
return

F2::Pause
Esc::ExitApp

MoveMouseInCircle(r := 350, degInc := 5, start := "top", speed := 0)
{
	static radPerDeg := 3.14159265359 / 180

	MouseGetPos, cx, cy
	Switch start
	{
		Case "top":
			angle := 0
			cy += r
		Case "right":
			angle := 90 * radPerDeg
			cx -= r
		Case "bottom":
			angle := 180 * radPerDeg
			cy -= r
		Case "left":
			angle := 270 * radPerDeg
			cx += r
	}
	loop, % 360 / degInc
	{
		angle += degInc * radPerDeg
		MouseMove, cx + r * Sin(angle), cy - r * Cos(angle)
        Send R
        Click
		Sleep, speed
	}
}