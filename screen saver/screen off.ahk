#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;~ BlockInput, MouseMove

SendMessage, 0x112, 0xF170, 2, , Program Manager ;모니터 종료

return


LButton::
SendMessage, 0x112, 0xF170, -1, , Program Manager
;~ BlockInput, MouseMoveoff
MouseMove, 959, 539, 2
ExitApp