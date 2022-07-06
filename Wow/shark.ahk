If not A_IsAdmin ;force the script to run as admin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#SingleInstance, force
#InstallMouseHook
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode, Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
DetectHiddenWindows, On ;this for background sending
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

#Include ..\Lib\VA-2.3\VA.ahk

global button_fish = "0"
global button_clean = "9"
global button_buff = "8"
global button_quit = "7"
global button_GUI = ";"
global button_allBags = "i"

global c := 0x090C45 ; the redish leaf of the bob
global threshold := 20
global quitTimer := 60 * 60 * 1000 * 5
global buffDuration := 60 * 1000 * 10
global castDuration := 18000 ;20 sec cast - the 2sec wait after casting due to sound
global title := "World of Warcraft"
global ToolTipX := A_ScreenWidth // 2
global ToolTipY := A_ScreenHeight * 0.6
global searchRectX1 := A_ScreenWidth * 0.2 ; ignores the left most of the screen
global searchRectY1 := 0 ; starts at the very top of the screen
global searchRectX2 := A_ScreenWidth * 0.8 ; ignores the right most of the screen
global searchRectY2 := A_ScreenHeight * 0.7 ; ignores the bottom 30% of the screen

; set the color to search for
^i::
  MouseGetPos, MouseX, MouseY
  xColor := MouseX
  yColor := MouseY
  PixelGetColor, color, %xColor%, %yColor%
  ToolTip, Mouse Pos: %MouseX% : %MouseY% `nThe color at %xColor% %yColor% is %color%, %MouseX%, %MouseY%
  c:= color
return

^o::
  MouseGetPos, searchRectX1, searchRectY1
  ToolTip, Search rectangle coords are now |%searchRectX1% %searchRectY1%| : |%searchRectX2% %searchRectY2%|, %searchRectX1%, %searchRectY1%
return

!o::
  MouseGetPos, searchRectX2, searchRectY2
  ToolTip, Search rectangle coords are now |%searchRectX1% %searchRectY1%| : |%searchRectX2% %searchRectY2%|, %searchRectX2%, %searchRectY2%
return

; test the volume
^p::
  CheckVolume(15, 1000)
  ToolTip, DONE, %ToolTipX%, %ToolTipY%
return

~NumLock::
  Fish()
return

Fish()
{
  bobX := 500
  bobY := 500
  startTime := A_TickCount
  buffTime := A_TickCount

  while(GetKeyState("NumLock", "T"))
  {
    if (A_TickCount - startTime > quitTimer)
    {
      SendButton(button_quit) ;logout button
      return
    }
    if (A_TickCount - buffTime > buffDuration + 1000)
    {
      ;Send 6	;buff button
      ;Send 5	;fishing rod button
      SendButton(button_buff) 	;macro to buff fishing rod and click Yes to replace
      Sleep 6000
      buffTime := A_TickCount
    }
    SendButton(button_clean)	;clean inv macro
    Sleep 100
    SendButton(button_fish)	;fishing macro
    Sleep 2000
    if TryFindBob(c, 20, bobX, bobY)
    {
      SendButton(button_allBags)
      Sleep 1000
      if CheckVolume(threshold, castDuration)
      {
        RightClick(bobX, bobY) ; loot
        Sleep 1000
      }
    }
  }

  ToolTip
return
}

; search the screen for that pixel color
TryFindBob(color, delta, ByRef aX, ByRef aY)
{
  result := true
  SendButton(button_GUI)

  WinGetActiveTitle, activeTitle
  WinActivate, %title%

  PixelSearch, aX, aY, searchRectX1, searchRectY1, searchRectX2, searchRectY2, %color%, %delta%, Fast
  WinActivate, %activeTitle%
  if ErrorLevel
  {
    ToolTip, Cant find %color% in the region, %ToolTipX%, %ToolTipY%
    result := False
  }
  else
  {
    ToolTip, A color %color% within 3 shades of variation was found at X%aX% Y%aY%.,%aX%,%aY%
  }

  SendButton(button_GUI)
return result
}

CheckVolume(thresh, timeout)
{
  result := false
  MeterLength = 30
  peak := 0
  minAllowedPeak := 12
  startTime := A_TickCount
  audioMeter := VA_GetAudioMeter()

  ; "The peak value for each channel is recorded over one device
  ;  period and made available during the subsequent device period."
  VA_GetDevicePeriod("capture", devicePeriod)

  While(GetKeyState("NumLock", "T") and !result)
  {
    elapsedTime := A_TickCount - startTime

    if(A_TickCount - startTime > timeout)
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

    if(current > thresh)
      result := True ;we got volume peak so we are done

    if(current > peak)
    {
      peak := current
    }

    ToolTip,% "Cur: " . current . "`nTop: " . peak . "`nReq: " . thresh . "`nTime: " . elapsedTime//1000, %ToolTipX%, %ToolTipY%

    Sleep, %devicePeriod%
  }

return result
}

SendButton(button)
{
  ControlSend,,%button%, %title%
}

RightClick(x, y) 
{ 
  WinGetActiveTitle, activeTitle
  WinActivate, %title%
  ToolTip, Looting at %x% %y%, %x%, %y%
  ;https://www.autohotkey.com/docs/misc/SendMessageList.htm
  lParam := x & 0xFFFF | (y & 0xFFFF) << 16
  WinActivate, %title%
  PostMessage, 0x200, 0, lParam,, %title% 
  PostMessage, 0x204, 1,,, %title% 
  PostMessage, 0x205, 0,,, %title%

  WinActivate, %activeTitle%
return
}
