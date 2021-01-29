#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SoundPlay, C:\Windows\Media\Windows Ding.wav, Wait
SoundBeep, 18000, 2000

; SoundPlay, C:\Windows\Media\Windows Ding.wav
; Sleep, 1000

ExitApp