WinGet, wowid, List, World of Warcraft 

; SUSPEND KEYS 
; These keys will suspend the use of all other hotkeys in this script 
~Pause:: 
 
   Suspend, Toggle 
Return 

; ******************* 
; *** Other Keys  *** 
; ******************* 

#IfWinActive, World of Warcraft 
   ~Q:: 
	ControlSend,,{Q down}{Q up},  ahk_id %wowid1% 
	ControlSend,,{Q down}{Q up},  ahk_id %wowid2% 
	ControlSend,,{Q down}{Q up},  ahk_id %wowid3% 
	ControlSend,,{Q down}{Q up},  ahk_id %wowid4% 
	ControlSend,,{Q down}{Q up},  ahk_id %wowid5% 

return 

#IfWinActive, World of Warcraft 
   ~E:: 
	ControlSend,,{E down}{E up},  ahk_id %wowid1% 
	ControlSend,,{E down}{E up},  ahk_id %wowid2% 
	ControlSend,,{E down}{E up},  ahk_id %wowid3% 
	ControlSend,,{E down}{E up},  ahk_id %wowid4% 
	ControlSend,,{E down}{E up},  ahk_id %wowid5% 

return 

#IfWinActive, World of Warcraft 
   ~F:: 
	ControlSend,,{F down}{F up},  ahk_id %wowid1% 
	ControlSend,,{F down}{F up},  ahk_id %wowid2% 
	ControlSend,,{F down}{F up},  ahk_id %wowid3% 
	ControlSend,,{F down}{F up},  ahk_id %wowid4% 
	ControlSend,,{F down}{F up},  ahk_id %wowid5% 

return 

#IfWinActive, World of Warcraft 
   ~X:: 
	ControlSend,,{X down}{X up},  ahk_id %wowid1% 
	ControlSend,,{X down}{X up},  ahk_id %wowid2% 
	ControlSend,,{X down}{X up},  ahk_id %wowid3% 
	ControlSend,,{X down}{X up},  ahk_id %wowid4% 
	ControlSend,,{X down}{X up},  ahk_id %wowid5% 

#IfWinActive, World of Warcraft 
   ~R:: 
	ControlSend,,{r down}{r up},  ahk_id %wowid1% 
	ControlSend,,{r down}{r up},  ahk_id %wowid2% 
	ControlSend,,{r down}{r up},  ahk_id %wowid3% 
	ControlSend,,{r down}{r up},  ahk_id %wowid4% 
	ControlSend,,{r down}{r up},  ahk_id %wowid5% 

return 


#IfWinActive, World of Warcraft 
   ~B:: 
	ControlSend,,{B down}{B up},  ahk_id %wowid1% 
	ControlSend,,{B down}{B up},  ahk_id %wowid2% 
	ControlSend,,{B down}{B up},  ahk_id %wowid3% 
	ControlSend,,{B down}{B up},  ahk_id %wowid4% 
	ControlSend,,{B down}{B up},  ahk_id %wowid5% 
return

#IfWinActive, World of Warcraft 
   Space::  ; jump 
	KeyWait, Space, D 
  	 ControlSend,, {Space} , ahk_id %wowid1% 
   	 ControlSend,, {Space} , ahk_id %wowid2%
  	 ControlSend,, {Space} , ahk_id %wowid3%
  	 ControlSend,, {Space} , ahk_id %wowid4%
  	 ControlSend,, {Space} , ahk_id %wowid5% 
Return 


; ******************* 
; *** Hotbars 1-0 *** 
; ******************* 


#IfWinActive, World of Warcraft 
   ~1:: 
	ControlSend,,{1 down}{1 up},  ahk_id %wowid1% 
	ControlSend,,{1 down}{1 up},  ahk_id %wowid2% 
	ControlSend,,{1 down}{1 up},  ahk_id %wowid3% 
	ControlSend,,{1 down}{1 up},  ahk_id %wowid4% 
	ControlSend,,{1 down}{1 up},  ahk_id %wowid5% 

return 

#IfWinActive, World of Warcraft 
   ~2:: 

	ControlSend,,{2 down}{2 up},  ahk_id %wowid1% 
	ControlSend,,{2 down}{2 up},  ahk_id %wowid2% 
	ControlSend,,{2 down}{2 up},  ahk_id %wowid3% 
	ControlSend,,{2 down}{2 up},  ahk_id %wowid4% 
	ControlSend,,{2 down}{2 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~3:: 

	ControlSend,,{3 down}{3 up},  ahk_id %wowid1% 
	ControlSend,,{3 down}{3 up},  ahk_id %wowid2% 
	ControlSend,,{3 down}{3 up},  ahk_id %wowid3% 
	ControlSend,,{3 down}{3 up},  ahk_id %wowid4% 
	ControlSend,,{3 down}{3 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~4:: 
   	ControlSend,,{4 down}{4 up},  ahk_id %wowid1% 
	ControlSend,,{4 down}{4 up},  ahk_id %wowid2% 
	ControlSend,,{4 down}{4 up},  ahk_id %wowid3% 
	ControlSend,,{4 down}{4 up},  ahk_id %wowid4% 
	ControlSend,,{4 down}{4 up},  ahk_id %wowid5%  
return 

#IfWinActive, World of Warcraft 
   ~5:: 
	ControlSend,,{5 down}{5 up},  ahk_id %wowid1% 
	ControlSend,,{5 down}{5 up},  ahk_id %wowid2% 
	ControlSend,,{5 down}{5 up},  ahk_id %wowid3% 
	ControlSend,,{5 down}{5 up},  ahk_id %wowid4% 
	ControlSend,,{5 down}{5 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~6:: 

	ControlSend,,{6 down}{6 up},  ahk_id %wowid1% 
	ControlSend,,{6 down}{6 up},  ahk_id %wowid2% 
	ControlSend,,{6 down}{6 up},  ahk_id %wowid3% 
	ControlSend,,{6 down}{6 up},  ahk_id %wowid4% 
	ControlSend,,{6 down}{6 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~7:: 
	ControlSend,,{7 down}{7 up},  ahk_id %wowid1% 
	ControlSend,,{7 down}{7 up},  ahk_id %wowid2% 
	ControlSend,,{7 down}{7 up},  ahk_id %wowid3% 
	ControlSend,,{7 down}{7 up},  ahk_id %wowid4% 
	ControlSend,,{7 down}{7 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~8:: 
	ControlSend,,{8 down}{8 up},  ahk_id %wowid1% 
	ControlSend,,{8 down}{8 up},  ahk_id %wowid2% 
	ControlSend,,{8 down}{8 up},  ahk_id %wowid3% 
	ControlSend,,{8 down}{8 up},  ahk_id %wowid4% 
	ControlSend,,{8 down}{8 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~9:: 
	ControlSend,,{9 down}{9 up},  ahk_id %wowid1% 
	ControlSend,,{9 down}{9 up},  ahk_id %wowid2% 
	ControlSend,,{9 down}{9 up},  ahk_id %wowid3% 
	ControlSend,,{9 down}{9 up},  ahk_id %wowid4% 
	ControlSend,,{9 down}{9 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~0:: 
	ControlSend,,{0 down}{0 up},  ahk_id %wowid1% 
	ControlSend,,{0 down}{0 up},  ahk_id %wowid2% 
	ControlSend,,{0 down}{0 up},  ahk_id %wowid3% 
	ControlSend,,{0 down}{0 up},  ahk_id %wowid4% 
	ControlSend,,{0 down}{0 up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~c:: 
	ControlSend,,{c down}{c up},  ahk_id %wowid1% 
	ControlSend,,{c down}{c up},  ahk_id %wowid2% 
	ControlSend,,{c down}{c up},  ahk_id %wowid3% 
	ControlSend,,{c down}{c up},  ahk_id %wowid4% 
	ControlSend,,{c down}{c up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+:: 
	ControlSend,,{+ down}{+ up},  ahk_id %wowid1% 
	ControlSend,,{+ down}{+ up},  ahk_id %wowid2% 
	ControlSend,,{+ down}{+ up},  ahk_id %wowid3% 
	ControlSend,,{+ down}{+ up},  ahk_id %wowid4% 
	ControlSend,,{+ down}{+ up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~\:: 
	ControlSend,,{\ down}{\ up},  ahk_id %wowid1% 
	ControlSend,,{\ down}{\ up},  ahk_id %wowid2% 
	ControlSend,,{\ down}{\ up},  ahk_id %wowid3% 
	ControlSend,,{\ down}{\ up},  ahk_id %wowid4% 
	ControlSend,,{\ down}{\ up},  ahk_id %wowid5% 
return 

; *************************** 
; *** Hotbars Shift ^ 1-0 *** 
; *************************** 


#IfWinActive, World of Warcraft 
   ~+1:: 
   ControlSend,,{Shift down}{1 down}{1 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{1 down}{1 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{1 down}{1 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{1 down}{1 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{1 down}{1 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+2:: 
   ControlSend,,{Shift down}{2 down}{2 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{2 down}{2 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{2 down}{2 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{2 down}{2 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{2 down}{2 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+3:: 
   ControlSend,,{Shift down}{3 down}{3 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{3 down}{3 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{3 down}{3 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{3 down}{3 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{3 down}{3 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+4:: 
   ControlSend,,{Shift down}{4 down}{4 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{4 down}{4 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{4 down}{4 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{4 down}{4 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{4 down}{4 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+5:: 
   ControlSend,,{Shift down}{5 down}{5 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{5 down}{5 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{5 down}{5 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{5 down}{5 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{5 down}{5 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+6:: 
   ControlSend,,{Shift down}{6 down}{6 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{6 down}{6 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{6 down}{6 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{6 down}{6 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{6 down}{6 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+7:: 
   ControlSend,,{Shift down}{7 down}{7 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{7 down}{7 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{7 down}{7 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{7 down}{7 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{7 down}{7 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+8:: 
   ControlSend,,{Shift down}{8 down}{8 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{8 down}{8 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{8 down}{8 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{8 down}{8 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{8 down}{8 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+9:: 
   ControlSend,,{Shift down}{9 down}{9 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{9 down}{9 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{9 down}{9 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{9 down}{9 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{9 down}{9 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+0:: 
   ControlSend,,{Shift down}{0 down}{0 up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{0 down}{0 up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{0 down}{0 up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{0 down}{0 up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{0 down}{0 up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~++:: 
   ControlSend,,{Shift down}{+ down}{+ up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{+ down}{+ up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{+ down}{+ up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{+ down}{+ up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{+ down}{+ up}{Shift up},  ahk_id %wowid5% 
return 

#IfWinActive, World of Warcraft 
   ~+\:: 
   ControlSend,,{Shift down}{\ down}{\ up}{Shift up},  ahk_id %wowid1% 
   ControlSend,,{Shift down}{\ down}{\ up}{Shift up},  ahk_id %wowid2% 
   ControlSend,,{Shift down}{\ down}{\ up}{Shift up},  ahk_id %wowid3% 
   ControlSend,,{Shift down}{\ down}{\ up}{Shift up},  ahk_id %wowid4% 
   ControlSend,,{Shift down}{\ down}{\ up}{Shift up},  ahk_id %wowid5% 
return 

; ************************** 
; *** Hotbars Cntl ^ 1-0 *** 
; ************************** 


#IfWinActive, World of Warcraft 
   ~^1:: 
   ControlSend,,{Ctrl down}{1 down}{1 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{1 down}{1 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{1 down}{1 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{1 down}{1 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{1 down}{1 up}{Ctrl up},  ahk_id %wowid5%

return 

#IfWinActive, World of Warcraft 
   ~^2:: 
   ControlSend,,{Ctrl down}{2 down}{2 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{2 down}{2 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{2 down}{2 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{2 down}{2 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{2 down}{2 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^3:: 
   ControlSend,,{Ctrl down}{3 down}{3 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{3 down}{3 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{3 down}{3 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{3 down}{3 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{3 down}{3 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^4:: 
   ControlSend,,{Ctrl down}{4 down}{4 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{4 down}{4 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{4 down}{4 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{4 down}{4 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{4 down}{4 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^5:: 
   ControlSend,,{Ctrl down}{5 down}{5 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{5 down}{5 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{5 down}{5 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{5 down}{5 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{5 down}{5 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^6:: 
   ControlSend,,{Ctrl down}{6 down}{6 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{6 down}{6 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{6 down}{6 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{6 down}{6 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{6 down}{6 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^7:: 
   ControlSend,,{Ctrl down}{7 down}{7 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{7 down}{7 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{7 down}{7 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{7 down}{7 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{7 down}{7 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^8:: 
   ControlSend,,{Ctrl down}{8 down}{8 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{8 down}{8 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{8 down}{8 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{8 down}{8 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{8 down}{8 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^9:: 
   ControlSend,,{Ctrl down}{9 down}{9 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{9 down}{9 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{9 down}{9 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{9 down}{9 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{9 down}{9 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^0:: 
   ControlSend,,{Ctrl down}{0 down}{0 up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{0 down}{0 up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{0 down}{0 up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{0 down}{0 up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{0 down}{0 up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^+:: 
   ControlSend,,{Ctrl down}{+ down}{+ up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{+ down}{+ up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{+ down}{+ up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{+ down}{+ up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{+ down}{+ up}{Ctrl up},  ahk_id %wowid5%
return 

#IfWinActive, World of Warcraft 
   ~^\:: 
   ControlSend,,{Ctrl down}{\ down}{\ up}{Ctrl up},  ahk_id %wowid1%
   ControlSend,,{Ctrl down}{\ down}{\ up}{Ctrl up},  ahk_id %wowid2%
   ControlSend,,{Ctrl down}{\ down}{\ up}{Ctrl up},  ahk_id %wowid3%
   ControlSend,,{Ctrl down}{\ down}{\ up}{Ctrl up},  ahk_id %wowid4%
   ControlSend,,{Ctrl down}{\ down}{\ up}{Ctrl up},  ahk_id %wowid5%
return