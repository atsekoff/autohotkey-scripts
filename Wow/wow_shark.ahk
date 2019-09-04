#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include ..\Lib\VA-2.3\VA.ahk
;#Include D:\stuffz\AHK_Lib\VA-2.3\VA.ahk

global c:= 0
global threshold:=20


; set the color to search for
^i::  ; Control+Alt+Z hotkey.
MouseGetPos, MouseX, MouseY
xColor := MouseX
yColor := MouseY
PixelGetColor, color, %xColor%, %yColor%
ToolTip, Mouse Pos: %MouseX% : %MouseY% `nThe color at %xColor% %yColor% is %color% ,222,222
c:= color
;MouseMove, %xColor%, %yColor%
return



; test the volume
^p::
CheckVolume(15)
ToolTip, DONE, 0,0
return


~ScrollLock::
while(GetKeyState("ScrollLock", "T"))
{
	Send 0
	Sleep 2000
	CheckVolume(threshold)
	Send {Alt Down}z{Alt Up}
	Sleep 300
	SearchBob(c, 20)
	Sleep 300
	Send {Alt Down}z{Alt Up}
	Send {Shift Down}{RButton}{Shift Up}
	Sleep 1000
}

ToolTip
return



; search the screen for that pixel color
SearchBob(color, delta)
{
	PixelSearch, Px, Py, 0, 0, 1900, 1000, %color%, %delta%, Fast
	if ErrorLevel
	{
		ToolTip, Cant find %color% in the region, 200, 200
	}
	else
	{
		ToolTip, A color %color% within 3 shades of variation was found at X%Px% Y%Py%.,0,0
		MouseMove, %Px%, %Py%
	}
return	
}



CheckVolume(thresh)
{
	#SingleInstance, Force
	MeterLength = 30
	peak:=0
	startTime:= A_TickCount
	audioMeter := VA_GetAudioMeter()

	; "The peak value for each channel is recorded over one device
	;  period and made available during the subsequent device period."
	VA_GetDevicePeriod("capture", devicePeriod)

	While(GetKeyState("ScrollLock", "T"))
	{
		elapsedTime := A_TickCount - startTime

		if(A_TickCount - startTime > 30000)
		{
			if(peak > 10)
			{
				threshold:=peak
			}
			break
		}

		; Get the peak value across all channels.
		VA_IAudioMeterInformation_GetPeakValue(audioMeter, peakValue)
		current:= peakValue * 100
		
		ToolTip, current: %current% `n highest: %peak% `n required: %thresh% `n elapsed time: %elapsedTime%, 0,0
		
		if(current > thresh)
		{
			break
		}
		
		if(current > peak)
		{
			peak := current
		}
		
		Sleep, %devicePeriod%
	}
	return
}
