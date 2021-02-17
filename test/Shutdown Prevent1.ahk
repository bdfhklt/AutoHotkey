#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DllCall("kernel32.dll\SetProcessShutdownParameters", "UInt", 0x4FF, "UInt", 0) ; 프로세스 종료 우선순위 최고값으로 변경
OnMessage(0x11, "WM_QUERYENDSESSION")
Return

WM_QUERYENDSESSION(wParam, lParam)
{
	MsgBox, test ; 종료 방지
	Return
}
