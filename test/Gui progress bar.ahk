#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Random, t1, 25, 75

;~ a := A_TickCount
;~ Sleep 50
;~ b := A_TickCount - a
Gui, Font, s40 Bold
Gui, Add, Text, , %t1%

Gui, Add, Progress, w200 h40 vprogress1 -smooth
Gui, Add, Progress, w200 h40 vprogress2
GuiControl, , progress1, %t1%
GuiControl, , progress2, %t1%

Gui, Show, AutoSize Center

Sleep 1000

t1 := 100
GuiControl, , progress1, %t1%
GuiControl, , progress2, %t1%
Sleep 1000



Sleep 500
ExitApp

;~ a := 1
;~ if (a)
;~ {
	;~ SoundPlay, *64
;~ }

SoundPlay, *64

return

