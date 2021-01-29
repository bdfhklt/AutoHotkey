#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DllCall("kernel32.dll\SetProcessShutdownParameters", UInt, 0x3FF, UInt, 0) ; 프로세스 종료 우선순위를 (시스템 예약 범위 제외) 최고 값으로 변경
OnMessage(0x11, "WM_QUERYENDSESSION")
OnExit("ExitFunc") ; 종료 방지 2
Return

WM_QUERYENDSESSION(wParam, lParam)
{
	Gui, Show ; 종료 방지 1
	DetectHiddenWindows, On

	; utorrent(μTorrent)
	win1 := "μTorrent"
	IfWinExist, %win1%
	{
		WinClose, %win1%
		ControlSend, , {Enter}, %win1%
		WinWaitClose, %win1%
		Sleep, 2000
	}
	
	Gui, Show, , ExitApp
}

ExitFunc()
{
	WinWait, ExitApp
	Return
}