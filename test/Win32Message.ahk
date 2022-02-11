#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; SendMessage
DetectHiddenWindows, On
WinGet, targetHwnd, ID, ahk_exe SoundControl.exe
OutputDebug, targetHwnd %targetHwnd%
if (targetHwnd != "")
{
	WM_APP := 0x8000
	result := DllCall("user32.dll\SendMessage", "UInt", targetHwnd, "UInt", WM_APP, "Int", 0, "UInt", 0) ; 0 = success
	OutputDebug, % result
}
