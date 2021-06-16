#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; SoundPlay, C:\Windows\Media\Windows Ding.wav, Wait ; 사용시 일부 프로그램의 볼륨 믹서가 음소거되는 버그 발생
; SoundBeep, 200, 400

; SoundPlay, C:\Windows\Media\Windows Ding.wav
; Sleep, 1000

SoundPlay, *-1, wait
; SoundPlay, *16, wait
; SoundPlay, *48, wait
; SoundPlay, *64, wait

; SoundPlay, D:\Sound\Effect\Guns & Explodes\Track 79.mp3, wait ; 위와 같은 버그 발생

ExitApp