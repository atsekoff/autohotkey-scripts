#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;
; F1 = Make Sync
; F2 = Break Sync
; F3 = Abandon All Quests
; F4 = Logout
; F5 = Target npc
; ;  = Interact with target keybind
;
; ON BOX CHAR
; F1 = Accept Sync
; F2 - F7 = Share Quests 1 to 6


global ROUND_TIME := 30000
global LogoutTime := A_TickCount
global EnterX := 960
global EnterY := 1000

SwitchClient()
{	Send {Alt}
	Send {Tab}
	Send {Alt Down}{Tab}{Alt Up}
	sleep 500
	
	return
}

ShareQuests()
{
	delay := 700
	
	Send {F2}
	Sleep %delay%
	Send {F3}
	Sleep %delay%
	Send {F4}
	Sleep %delay%
	Send {F5}
	Sleep %delay%
	Send {F6}
	Sleep %delay%
	Send {F7}
	Sleep %delay%
	
	return
}

TurnIn()
{
	Send {F5} 	;target npc
	Sleep 500
	Send \;		;Interact with target (semi colon)
	Sleep 4000
	
	return
}

StartSync()
{
	Send {F1} ; PartySync
	Sleep 250
	SwitchClient()
	Sleep 500
	Send {F1} ; AcceptSync
	Sleep 1000
	
	return
}

StopSync()
{
	Send {F2}
	
	return
}

AbandonQuests()
{
	Send {F3}
	Sleep 500

	return
}

StartLogout()
{
	Send {F4}
	LogoutTime := A_TickCount
	Sleep 500
	
	return
}

Relog()
{
	elapsed := A_TickCount - LogoutTime
	
	while(elapsed < 24222)
	{
		ToolTip, Relogging: %elapsed%
		Click, %EnterX%, %EnterY%
		Sleep 200
		elapsed := A_TickCount - LogoutTime
	}
	
	ToolTip

	return
}

ShareAndAbandon()
{
	ToolTip Abandon Round
	StartSync()
	ShareQuests()
	SwitchClient()
	AbandonQuests()
	StopSync()
	
	return
}

ShareAndTurnIn()
{
	ToolTip Turnin Round
	StartSync()
	ShareQuests()
	SwitchClient()
	TurnIn()
	StopSync()
	
	return
}

;#If WinActive("World of Warcraft")

~CapsLock::
	if(GetKeyState("CapsLock", "T"))
	{
		ToolTip STARTING
		SetTimer, Run, -200
		; ToolTip
	}
	Else
	{
		Reload
	}
return






; MAIN LOOP :

Run:
	ToolTip StarTED
	Sleep 500
	
	; StartLogout()
	; ShareAndTurnIn()
	; Relog()
	; Sleep 5000
	; StartLogout()
	; ShareAndAbandon()
	; Relog()
	; Sleep 5000
	
	ShareAndTurnIn()
	StartLogout()
	Sleep 500
	ShareAndAbandon()
	Relog()
	Sleep 7000
	; StartLogout()
	; ShareAndAbandon()
	; Relog()
	; Sleep 7000
	
	if(GetKeyState("CapsLock", "T"))
	{
		SetTimer, Run, -200
		return
		; ToolTip
	}
Return




