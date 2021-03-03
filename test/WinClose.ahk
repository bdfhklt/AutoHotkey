#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DetectHiddenWindows, On
win1 := "μTorrent"
process1 := "uTorrent.exe"
WinClose, %win1%
OutputDebug, close
WinWaitClose,  %win1%
OutputDebug, win closed
Process, WaitClose, %process1%
OutputDebug, process closed
