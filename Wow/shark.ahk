#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, force

#Include ..\Lib\VA-2.3\VA.ahk
;#Include D:\stuffz\AHK_Lib\VA-2.3\VA.ahk

global c := 0
global threshold := 20
global timeToFishMs := 60 * 60 * 1000 * 5
global buffDuration := 60 * 1000 * 10
global fishingDuration := 20000 ;20 sec

; set the color to search for
^i::
  MouseGetPos, MouseX, MouseY
  xColor := MouseX
  yColor := MouseY
  PixelGetColor, color, %xColor%, %yColor%
  ToolTip, Mouse Pos: %MouseX% : %MouseY% `nThe color at %xColor% %yColor% is %color% ,222,222
  c:= color
return

; test the volume
^p::
  CheckVolume(15)
  ToolTip, DONE, 0,0
return

~NumLock::
  Fish()
return

Fish()
{
  x := 500
  y := 500
  startTime := A_TickCount
  buffTime := A_TickCount

  while(GetKeyState("NumLock", "T"))
  {
    if (A_TickCount - startTime > timeToFishMs)
    {
      Send 3 ;logout button
      return
    }
    if (A_TickCount - buffTime > buffDuration + 1000)
    {
      ;Send 6	;buff button
      ;Send 5	;fishing rod button
      Send 7 	;macro to buff fishing rod and click Yes to replace
      Sleep 6000
      buffTime := A_TickCount
    }
    Send i
    Sleep 500
    Send 9	;clean inv macro
    Sleep 100
    Send 0	;fishing macro
    Sleep 2000
    CheckVolume(threshold)
    Send {Alt Down}z{Alt Up}
    Sleep 300
    SearchBob(c, 20, x, y)
    Sleep 300
    Send {Alt Down}z{Alt Up}
    Click %x% %y% Right ; loot
    Sleep 1000
  }

  ToolTip
return
}

; search the screen for that pixel color
SearchBob(color, delta, ByRef aX, ByRef aY)
{
  ; cut off a portion of the screen sides horizontally
  pixelsToCut := A_ScreenWidth * 0.2
  PixelSearch, aX, aY, pixelsToCut, 0, A_ScreenWidth - pixelsToCut, A_ScreenHeight, %color%, %delta%, Fast
  if ErrorLevel
  {
    ToolTip, Cant find %color% in the region, 200, 200
  }
  else
  {
    ToolTip, A color %color% within 3 shades of variation was found at X%aX% Y%aY%.,222,222
  }
return	
}

CheckVolume(thresh)
{
  #SingleInstance, Force
  MeterLength = 30
  peak := 0
  minAllowedPeak := 10
  startTime := A_TickCount
  audioMeter := VA_GetAudioMeter()

  ; "The peak value for each channel is recorded over one device
  ;  period and made available during the subsequent device period."
  VA_GetDevicePeriod("capture", devicePeriod)

  While(GetKeyState("NumLock", "T"))
  {
    elapsedTime := A_TickCount - startTime

    if(A_TickCount - startTime > fishingDuration)
    {
      if(peak > minAllowedPeak)
      {
        threshold := peak
      }
      break
    }

    ; Get the peak value across all channels.
    VA_IAudioMeterInformation_GetPeakValue(audioMeter, peakValue)
    current:= peakValue * 100

    ToolTip, current: %current% `n highest: %peak% `n required: %thresh% `n elapsed time: %elapsedTime%, 222,222

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
