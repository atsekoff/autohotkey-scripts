#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive Apex Legends



;;; VARS
; global 1pump:= False
; global 2pump:= False
;;;;;;;;;;;;;;;;;;;;;

;;; Functions
; Reset()
; {
	; 1pump:= False
	; 2pump:= False
	; return
; }

; Spam(sKey, iTime)
; {
	; startTime:= A_TickCount
	; while(A_TickCount - startTime < iTime)
	; {
		; send {%sKey%}
		; sleep 10
	; }
	; return
; }

; IsGun1(imgFile)
; {
	; ImageSearch, FoundX, FoundY, 1500, 1030, 1600, 1080, *5 %imgFile%
	; return ErrorLevel=0
; }

; IsGun2(imgFile)
; {
	; ImageSearch, FoundX, FoundY, 1670, 1030, 1920, 1080, *5 %imgFile%
	; return ErrorLevel=0
; }

IsFullAuto()
{
	;BGR
	PixelGetColor, c, 1704, 1001
	return c=0xFFFFFF
}

;;; Hotkeys


; ;fastswitch 1
; *~1::
	; Reset()
	; sleep 50
	; 1pump:=IsGun1("1P.png")
; return 

; ;fastswitch 2
; *~2::
	; Reset()
	; sleep 50
	; 2pump:=IsGun2("2P.png")
; return

; ; fists
; *~3::
	; Reset()
; return

; ;fastswitch next
; *~`::
	; Reset()
; return

; ;nades
; *~g::
	; Reset()
; return


; Situational buttons ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


*~LButton up::
	SetTimer, FullAuto, Off
return

FullAuto:
	send j
	
	if(not GetKeyState("LButton", "P"))
	{
		SetTimer, FullAuto, Off
	}
Return

; #If 1pump and WinActive("Apex Legends")
; *~LButton::
	; spam("r", 350)
	; spam("3", 50)
	; send 1
; return

; #If 2pump and WinActive("Apex Legends")
; *~LButton::
	; spam("r", 350)
	; spam("3", 50)
	; send 2
; return

#If WinActive("Apex Legends")
*~LButton::
	if(IsFullAuto())
	{
		send {LButton up}
		SetTimer, FullAuto, 44
	}
return


