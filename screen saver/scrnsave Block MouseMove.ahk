#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

BlockInput, MouseMove
run, open "C:\Windows\System32\scrnsave.scr"

Loop
{
	Sleep, 2000
	Process, exist, scrnsave.scr
	;~ t1 = %ErrorLevel%
	;~ if t1 = 0
	if ErrorLevel = 0
	{
		run, open "C:\Windows\System32\scrnsave.scr"
	}
}

return


LButton::
BlockInput, MouseMoveoff
MouseMove, 959, 539, 2
ExitApp