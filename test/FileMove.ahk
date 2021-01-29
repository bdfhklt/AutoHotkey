#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;FileMove, FileMove\t1.txt, FileMove\t2.*
;MsgBox, % ErrorLevel

FileMove, FileMove\t*.*, FileMove\t*.*

ExitApp