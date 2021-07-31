#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 기본 재생 장치 스위치
UnmuteSystemSoundsExe := A_ScriptDir . "\..\UnmuteSystemSounds\UnmuteSystemSounds.exe"
SoundVolumeViewExe := A_ScriptDir . "\..\SoundVolumeView\soundvolumeview-x64\SoundVolumeView.exe"
device1 := "speaker"
device2 := "headphone"

RunWait, %UnmuteSystemSoundsExe%
RunWait, %SoundVolumeViewExe% /switchdefault %device1% %device2% all
SoundPlay, *-1, wait
return
