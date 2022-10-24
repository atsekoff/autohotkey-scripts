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
global threshold := 45 ; threshold to use with the custom fishing sounds
global quitHoursMax := 10
global quitHours := 5
global quitTimer := 60 * 60 * 1000 * quitHours
global buffDuration := 60 * 1000 * 10
global castDuration := 13000 ;15(wotlk) sec cast - the 2sec wait after casting due to sound
global title := "World of Warcraft"
global ToolTipX := A_ScreenWidth // 2
global ToolTipY := A_ScreenHeight * 0.6
global searchRectX1 := A_ScreenWidth * 0.2 ; ignores the left most of the screen
global searchRectY1 := 0 ; starts at the very top of the screen
global searchRectX2 := A_ScreenWidth * 0.8 ; ignores the right most of the screen
global searchRectY2 := A_ScreenHeight * 0.7 ; ignores the bottom 30% of the screen

MsgBox, fishing = 0`nclean=9`nbuff=8`nquit=7`nhideUI=semicolon`nopenbags=i`nctrlO=TopLeftCorner`naltO=botRightCorner`nctrl+I=searchColor`nctrl+P=timer`nNumLock=Start
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
  quitHours := quitHours + 1
  if quitHours > %quitHoursMax%
    quitHours := 1

  quitTimer := 60 * 60 * 1000 * quitHours
  ToolTip, Quitting in %quitHours% hours, %ToolTipX%, %ToolTipY%
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
        Loot(bobX, bobY) ; loot
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
  PixelSearch, aX, aY, searchRectX1, searchRectY1, searchRectX2, searchRectY2, %color%, %delta%, Fast
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

Loot(x, y)
{
  ToolTip, Looting at %x% %y%, %x%, %y%
  WinGetActiveTitle, activeTitle
  WinActivate, %title%
  MoveMouse(x, y)
  RightClick(x, y)
  WinActivate, %activeTitle%
Return
}

SendButton(button)
{
  ControlSend,,%button%, %title%
}

MoveMouse(x, y)
{
  ;https://www.autohotkey.com/docs/misc/SendMessageList.htm
  lParam := x & 0xFFFF | (y & 0xFFFF) << 16
  PostMessage, 0x200, 0, lParam,, %title% 
return
}

LeftClick(x, y)
{
  PostMessage, 0x201, 1,,, %title% 
  PostMessage, 0x202, 0,,, %title%
return
}

RightClick(x, y) 
{ 
  ;https://www.autohotkey.com/docs/misc/SendMessageList.htm
  PostMessage, 0x204, 1,,, %title% 
  PostMessage, 0x205, 0,,, %title%
return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Weak aura to adjust volume while fishing
; !WA:2!LI1xVTXXr8ilzhxIcuz5ubN4IIfeTwIf002cUP)nfquMYwj6FHI(pXbjI7D3EKR1XDVU7DKIUO9bHI2G8O(iOh6t9j9wFRWafOpUWOOFa0hH8jOZS7DK8eLDkApajEC3zMD(ZVz2z4mRVqVfcwi4RULsMMeXfm1opU1MBSDJxttt6kv7eNWLc9xVE9KHXStdyAFf3Uw9e2HjXVy1OiIMLKWfD0KUmfJKqpGryHHm)eIuenKmOlpIrc56Uar1ipTltqgktj6ezC(YvXvuJLKURmnkG4XikwFMkHfu7OqPizp(lznJOQoSMd4bjDV86M586YObmL5kxsLQzBt7X6AkHByUS5kXF92YeqP6stG)XiLDAgVpRmrQiLtKj0OYK(YO0EmIm0suMsr8KEEmfHRj(0i)0ikOheVHKEPrj84OHini99O6eGUmHqfbK9KPW)ByplD2g1mx1RhlGN2duV(GENi70jIPcyHuqGTRJE34FCdb1d8xojSCNiPhnkAyLIUXvoGn8uMLslHOL)aG921fG9F26sLFUi2rykn7FXmxtfv0Hz((TxPh9WzRdAC8UZD3A39NcBVspUygZIXVxr9(jw92CT4YxK9uuJmx)yD4HzCm)SG9z(EM57AU2HZ8Z2sgWdhEo30aehmcvyTAN)eC3d4aSsX0GBHWfGhLibua4hirYuiwF(iK2QE8qhkQ45aItitiP6u0pcBEieeDQoU(in4rYbiuRkXha8C8qc46jvkN4jDP9bGce2ZownXfhGGfRwNAvb0HM7xXb5qgcKILsidOcabkjDyjeDAqadtnYSMbJtjOQXQK56VQN1ZTL1GGqhgIYCMU1Ydr2iS5gijV)SMpyuG1CtiS(6I0ET4BU15IefIJVY5)gfk)tah3ERuilYhYePq8Whse6ivCMgZyCo)jdNM5o1MIOzraEXS4PwUTyiTz(N3fF86tJsz6NF0Q984mHpZ7bCAKSZRA0toI4MBH(Yt2f8zzCdg41R3dehyCNcbO4i6WwqLOlPgUtyiu)yMtPcFOY1UsUiXBTgB3QrZ459tHQn9qcFCCaO9EP2pwjvffFZUjjX6F5DUZaAhznU8o9oyRDcVnFWw35(kQVTa4h20gAULNtqhEzYTVn5Hsiidfo70LGqZSIhokisxLZAeixKWO(Djwd2bl46sa)EmeBHiBfhbea0dOdqSqkgxWta)rgtAzgFjajcGrKDi)irQyzUEle9Pm6bRMQOiOpvKO4D6aLKdQvkscvWCIFvrWoUJKr(icfOEFMOFTZVxPsHGIFq1(ycymLR0lpMwPiK3PgggQaW7se4bYo6J2VW(n8j7m7tvyn5jplKXTOXXyP(p)GVyehNxhwoN5QK7wXsfteuc)ReCCNxDMOC4yfzkr6kLTVRklC7L9RLRsUxfNGDAnukRr(ffnz)waOcL(DzeGHi4rxaDRLQumrsbQUi9CYC6Xk6B)eNsgtKIs(jtT9OkXtj6ZRKjsrApOe6YpKLS2tOQC)ZwtCaLRuboJ3eL7T(ZgrwjwKM9)G58)V(wulYqiVzb9RFRk43k6z8Pv9nBlvYZl(Vda82oVcrJQVv0W5YtG6eUMbGZrZg3GLuuR0Bp3aSrxAX3cz47ypDpeYt3qVHO(dTSDCGCFxPW21XIz3Y8loC2)8fwcacR)oRwxm3m7EHYvNEp3vfx0o2BpC3vuCB7njJ8G4d4AQZ8PqNtqD1L0qxgcPTLUS6Pyzx4B(DX(M0tFuWTsJoOFFPsfRKgSxUNgmUP2Tyn4WuH9wgB5UQ5xiWEcw63fobvfCwyLyuTwkxylLDHHvxJz(8qoCDWsOywc71awpNDFh8p7(eS0UJSQwaiIlkY3y5LlHLkOxlvJq2i7cpRoqJuqB4dH2JapPBTa3PLlGjp0aj28LTlh7250mUzD(Bw4cP42qXvN0RIxk2JomxcWidEzrvKF4tfCxmtaAt(TJ6XPbfA9PAUmGRBhaDhITds6a9isTGamjsMFRBw(uMDMlVjmMc59fqeFo6d(cYhzVHOy()3chtx9d3OsLr8V3elFHaPS6cMFvBVqiRu3fslJ)BGj3mZSWHxGaf2Lk2tZu23ensmv3dJ03PBDWUFXEf(dxG9NR)huL0VsXQIqFcz3Pw0ookRlh9xElv2RF18Vcc777dvfBbtT22mx9uOcKznpSBrM6mDQheBHPjtdd5hE6(RT6ET2FVwR2S1riJiXTpkaSnmRCH7DmUiKpef1EeR7QyaRn3B3gBU5r5NKcHjcwutCimDPJS8SrGU0zOeOEAPYdAFN1wLkSsPomLTSP711aH00YHADhE8KaOp1WqRKFuJn3D9hV5XJ6QR0TmR(Vn1bJZSM5tnnnpAH7z2OT5JnFIztZwMh2gw)bM9mTm722844BSMSxmaE1q4ChFg0fz2PyAyw38zLWMPFHTquF2kuXW4RrTV3YDCOA)xFNVb6PMPe0ONaoCW3CWXubVN1n9HMFomYDDi3K9kgvZ2lbQ30jP77(6Ch5(4pHGsZGlTc0hH0GwMPD9EWmf446Tn0314z8nbWR)MPw5AX)d7Sp4yhUzoqWA2mmtKrdLZYId5ZNxoZultS(3QUj2WDXHUGK6UmQkRQxev3nt8lBLf1wEG4Xty6kKEyscO78OH1inT)2etuobef4J7ZLPAx1PI6dcB11QJ)qgXZVUI)sYNMsdaVdL0QLQVZN(DobWynzDWPh(GfnZ9A4REu)d6OqLQEKKg0)SriYdeYbI2118xYwSPDORsEj0iaqTOrwQowfhFPPpyxA8TtgZ2v)NFP6Lq8cqOxYC13hGNPqNcE8EXsvYR1DPbYbpZnv1SNOSAKnIDLJHb7cDdyvFNwT2zRtGCbwWtXFrM)439meuJGcF7c1xf(AM0(mN0(bVJ6fqRbqtq13SX6Tojr6Nz8xT)FVmp4SS4v2eREAwpy)M3R2k1U3PHki5cqxGxB2VXnR364sOQ5T3AnB0yBpxFrpX8dN18ETn1EEB8X8JM1qAVskp407F4d2E5p5fSDBe10xgjvF8SWJ6W8riDA7A2DMzMzM9eeZYTd0v6uUakV5a9lgFdEhbajY(DYAGzYnukPs3(ObsvWtv04JEA2llOBE)AGrSq))1Z(pd