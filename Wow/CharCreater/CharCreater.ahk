#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force

global names = ["Tank","Heal","Archer","Healer","Tazdingo","Dps","Noob","Spank","Peel","Doom","Big","Skeleton","Bro","Dude","Man","Guy"]
global nameIdx = 1

global logoLeftImg = "WowLogoLeft.png"
global logoRightImg = "WowLogoLeft.png"

global okayX = 1300
global okayY = 750
global acceptX = 2320
global acceptY = 1329

global logoRightX1 = 2130
global logoRightY1 = 20
global logoRightX2 = 2400
global logoRightY2 = 150

global logoLeftX1 = 100
global logoLeftY1 = 80
global logoLeftX2 = 330
global logoLeftY2 = 200

#If WinActive("World of Warcraft")

*~NumLock::
  ToolTip Waiting for realm...
    while(GetKeyState("NumLock", "T"))
  {
    if (IsCharCreateScreen())
    {
      CreateChar()
    }
    if (IsCharSelectScreen())
    {
      GoToCharCreate()
    }
  }

  Reload
return

CreateChar()
{
  ToolTip, Creating char...
  ClickOkay()
  Send ^a
  Sleep 100
  name := GetNextName()
  Send %name%
  Sleep 50
  ClickAccept()
  Sleep 350
  ToolTip
return
}

GetRandomName()
{
  Random, idx, 1, names.MaxIndex()
return names[idx]
}

GetNextName()
{
  name := names[nameIdx]
  nameIdx := nameIdx + 1
  if (nameIdx > names.MaxIndex())
  {
    nameIdx := 1
  }

return name
}

GoToCharCreate()
{
  ToolTip, Going to char creation screen...
  ClickOkay()
  Sleep 50
  Click, 2240, 1160
  ToolTip
return
}

ClickOkay()
{
  Click, %okayX%, %okayY%
  Sleep 10
return
}

ClickAccept()
{
  Click, %acceptX%, %acceptY%
  Sleep 100
return
}

IsCharCreateScreen()
{
return HasLoreArrow()
}

IsCharSelectScreen()
{
return HasRefreshButton()
}

HasLoreArrow()
{
  ImageSearch, x, y, 2454, 50, 2535, 920, *10 Arrow.png
  ; if (ErrorLevel = 2)
  ;   ToolTip Could not conduct the search.
  ; else if (ErrorLevel = 1)
  ;   ToolTip Icon could not be found on the screen.
  ; else
  ;   ToolTIp The icon was found at %x% %y%
return ErrorLevel = 0
}

HasRefreshButton()
{
  ImageSearch, x, y, 2440, 1137, 2500, 1175, *10 Refresh.png
  ; if (ErrorLevel = 2)
  ;   ToolTip Could not conduct the search.
  ; else if (ErrorLevel = 1)
  ;   ToolTip Icon could not be found on the screen.
  ; else
  ;   ToolTIp The icon was found at %x% %y%
return ErrorLevel = 0
}

HasWowLogoLeft()
{
  ImageSearch, x, y, logoRightX1, logoRightY1, logoRightX2, logoRightY2, *1 %logoLeftImg%
  if (ErrorLevel = 2)
    ToolTip Could not conduct the search.
  else if (ErrorLevel = 1)
    ToolTip Icon could not be found on the screen.
  else
    ToolTIp The icon was found at %x% %y%
return ErrorLevel = 0
}

HasWowLogoRight()
{
  ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, *1 %logoLeftImg%
  if (ErrorLevel = 2)
    ToolTip Could not conduct the search.
  else if (ErrorLevel = 1)
    ToolTip Icon could not be found on the screen.
  else
    Tooltip The icon was found at %x% %y%
return ErrorLevel = 0
}