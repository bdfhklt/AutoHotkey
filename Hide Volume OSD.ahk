﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance ignore
; HideVolumeOSD (C# 언어) 소스 코드 참조
targetHwnd := 0
foundHwnd := 0
count1 := 0
While ((foundHwnd := DllCall("user32.dll\FindWindowEx", "UInt", 0, "UInt", foundHwnd, "Str", "NativeHWNDHost", "Str", "")) != 0)
{
	OutputDebug, % foundHwnd
	if (DllCall("user32.dll\FindWindowEx", "UInt", foundHwnd, "UInt", 0, "Str", "DirectUIHWND", "Str", "") != 0)
	{
		targetHwnd := foundHwnd
		OutputDebug, % targetHwnd
		count1 += 1
	}
}
If (count1 != 1)
{
	targetHwnd := 0
	MsgBox, 0, Error, targetHwnd
}
If (targetHwnd != 0)
{
	Send, {Volume_Mute} ; (음소거 기능) OSD 표시
	Send, {Volume_Mute}
	; DllCall("user32.dll\ShowWindow","UInt", targetHwnd, "UInt", 0) ; 숨기기, 자체 타임아웃과 동일한 방식
	DllCall("user32.dll\ShowWindow","UInt", targetHwnd, "UInt", 6) ; 최소화, 더이상 나타나지 않음
	; DllCall("user32.dll\ShowWindow","UInt", targetHwnd, "UInt", 9) ; 복원, 숨겨진의 경우 숨기기 직전의 반투명한 창을 그대로 복원하는 부작용 발생
}
Return
