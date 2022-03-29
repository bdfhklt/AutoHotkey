#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance, ignore

WM_APP := 0x8000

OnMessage(WM_APP, "t1")
Return

t1(wParam, lParam)
{
	MsgBox, onMessage
	Return
}
