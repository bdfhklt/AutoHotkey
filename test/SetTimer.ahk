#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTimer, tmp1, -2000
SetTimer, tmp1, -1000
Sleep, 4000
Return

tmp1:
{
	OutputDebug, test
	Return
}