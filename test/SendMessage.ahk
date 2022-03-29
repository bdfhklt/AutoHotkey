#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WM_APP := 0x8000

DetectHiddenWindows, On

PostMessage, WM_APP, , , , ahk_exe OnMessage.exe

; GroupAdd, group1, ahk_exe AutoHotkey.exe
; PostMessage, 0x8000, , , , ahk_group group1
