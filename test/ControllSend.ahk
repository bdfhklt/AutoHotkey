﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; DetectHiddenWindows, On
; win1 := "μTorrent"
; WinClose, %win1%
; ControlSend, , n, %win1%

DetectHiddenWindows, On
GroupAdd, Group1
ControlSend, , {Volume_Mute}, ahk_group Group1
