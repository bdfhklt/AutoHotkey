#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance ignore
; HideVolumeOSD (C# 언어) 소스 코드 참조
targetHwnd := 0
testHwnd := 0
foundHwnd := 0
count1 := 0
While ((foundHwnd := DllCall("user32.dll\FindWindowEx", "UInt", 0, "UInt", foundHwnd, "Str", "NativeHWNDHost", "Str", "")) != 0)
{
	OutputDebug, foundHwnd %foundHwnd%
	testHwnd := DllCall("user32.dll\FindWindowEx", "UInt", foundHwnd, "UInt", 0, "Str", "DirectUIHWND", "Str", "")
	OutputDebug, testHwnd %testHwnd%
	if (testHwnd != 0)
	{
		targetHwnd := foundHwnd
		OutputDebug, targetHwnd %targetHwnd%
		count1 += 1
	}
}
If (count1 != 1)
{
	targetHwnd := 0
	MsgBox, 0, Error, not found targetHwnd
}
If (targetHwnd != 0)
{
; 	Send, {Volume_Mute} ; (음소거 기능) OSD 표시
; 	Send, {Volume_Mute}
	; DllCall("user32.dll\ShowWindow","UInt", targetHwnd, "UInt", 6) ; 숨기기
	; DllCall("user32.dll\ShowWindow","UInt", targetHwnd, "UInt", 9) ; 복원

	; result := DllCall("user32.dll\GetParent", "UInt", testHwnd) ; 0 = success
	; OutputDebug, % result
	; result := DllCall("user32.dll\SendMessage", "UInt", targetHwnd, "UInt", 0x0400 + 12, "Int", 0, "Int", 0) ; 0 = success
	; OutputDebug, % result
	result := DllCall("user32.dll\SendMessage", "UInt", targetHwnd, "UInt", 0x0100, "Int", 0, "UInt", 173) ; 0 = success
	OutputDebug, % result
}

; Send, {Volume_Mute}
; Send, {Volume_Mute}
; DllCall("user32.dll\ShowWindow","UInt", 201762, "UInt", 6)
; DllCall("user32.dll\ShowWindow","UInt", 201762, "UInt", 9)

Return
