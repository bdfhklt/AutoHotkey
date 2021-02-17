#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance ignore

i1 := 40
While (i1 <= 60)
{
	tmp1 := Round(i1 * 10 / 7, -1) / 10 * 7
	tmp1 := Round(tmp1)
	OutputDebug, %i1% => %tmp1%
	i1 += 1
}

Return
