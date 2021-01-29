#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
DllCall("kernel32.dll\SetProcessShutdownParameters", UInt, 0x4FF, UInt, 0) ; 프로세스 종료 우선순위 최고값으로 변경
OnMessage(0x11, "WM_QUERYENDSESSION")
OnExit("t1") ; 종료 방지 2
Return

WM_QUERYENDSESSION(wParam, lParam)
{
	; MsgBox, test ; 성공, 단독으로 사용
	; Return false ; 실패, 대소문자 구분없음
	; Return true ; 실패
	Gui, Show ; 종료 방지 1
	Return
}

t1()
{
	Sleep, 10000
	Return
}
