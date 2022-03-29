#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; #Persistent


; RegRead, targetFile, HKEY_CURRENT_USER\Control Panel\Desktop, SCRNSAVE.EXE
; OutputDebug, % targetFile


; temp1 := "test"
; OutputDebug, %temp1%123


; SoundPlay, C:\Windows\Media\Windows Ding.wav
; SoundPlay, C:\Windows\Media\Windows Background.wav


; arr1 := ["t0"]

; arr1.Push("t1")
; arr1.Push("t2")

; Loop, % arr1.Length()
; {
; 	OutputDebug, % A_Index
; 	OutputDebug, % arr1[A_Index]
; }


RunWait, % "powershell -NoExit ""pause"""


Return
