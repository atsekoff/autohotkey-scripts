If not A_IsAdmin ;force the script to run as admin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}
#SingleInstance, force
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

global c := 0
global threshold := 20
global quitTimer := 60 * 60 * 1000 * 5
global buffDuration := 60 * 1000 * 10
global castDuration := 20000 ;20 sec
global title := "World of Warcraft"
global ToolTipX := A_ScreenWidth // 2
global ToolTipY := A_ScreenHeight * 0.6

; set the color to search for
^i::
  MouseGetPos, MouseX, MouseY
  xColor := MouseX
  yColor := MouseY
  PixelGetColor, color, %xColor%, %yColor%
  ToolTip, Mouse Pos: %MouseX% : %MouseY% `nThe color at %xColor% %yColor% is %color%, %MouseX%, %MouseY%
  c:= color
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
  x := 500
  y := 500
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
    if TryFindBob(c, 20, x, y)
    {
      SendButton(button_allBags)
      Sleep 1000
      if CheckVolume(threshold, castDuration)
      {
        RightClick(x, y) ; loot
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
  SendButton(button_GUI)
  Sleep 300

  result := true
  ; cut off a portion of the screen sides horizontally
  pixelsToCut := A_ScreenWidth * 0.15
  PixelSearch, aX, aY, pixelsToCut, 0, A_ScreenWidth - pixelsToCut, A_ScreenHeight, %color%, %delta%, Fast
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
  minAllowedPeak := 10
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
  WinActivate, %title%
  ToolTip, Looting at %x% %y%, %x%, %y%
  ;https://www.autohotkey.com/docs/misc/SendMessageList.htm
  lParam := x & 0xFFFF | y << 16
  PostMessage, 0x200, 0, %lparam%,, %title% 
  PostMessage, 0x204, 0, %lparam%,, %title% 
  PostMessage, 0x205, 0, %lparam%,, %title% 
return
}
