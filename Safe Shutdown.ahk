#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
윈도우 10 로그아웃시 로그아웃을 일시중시하고 프로그램 안전 종료
! 윈도우 로그아웃 중 상태에서 새로운 프로그램 실행 불가 !
	따라서 실행된 프로그램과의 상호작용만 가능
*/

#SingleInstance ignore
DetectHiddenWindows, On

WM_QUERYENDSESSION := 0x0011

global processList := [] ; 종료할 프로세스 리스트

DllCall("kernel32.dll\SetProcessShutdownParameters", "UInt", 0x4FF, "UInt", 0) ; 프로세스 종료 우선순위를 최고 값으로 변경
OnMessage(WM_QUERYENDSESSION, "OnWM_QUERYENDSESSION") ; 프로세스 종료 메시지
OnExit("ExitFunc") ; 종료 방지 2
Return


OnWM_QUERYENDSESSION(wParam, lParam)
{
	Gui, Show ; 종료 방지 1

	; utorrent(μTorrent)
	win1 := "μTorrent"
	process1 := "uTorrent.exe"

	IfWinExist, % win1
	{
		processList.Push(process1)

		WinClose, % win1
		ControlSend, , {Enter}, % win1
		; OutputDebug, % "win close: " win1
	}


	; VirtualBox Headless
	process1 := "VBoxHeadless.exe"

	Process, Exist, % process1
	If (ErrorLevel != 0)
	{
		processList.Push(process1)

		Gui, Show, , % "Warning! press cancel button"
	}

	WaitAllClose() ; 모두 종료 대기
	Sleep, 2000

	Gui, Show, , % "ExitApp"
}


ExitFunc(exitReason)
{
	If (exitReason != "Menu" && exitReason != "Reload")
	{
		WinWait, % "ExitApp"
	}
	Return
}


WaitAllClose()
{
	Loop, % processList.Length()
	{
		; OutputDebug, % "wait close: " processList[A_Index]
		Process, WaitClose, % processList[A_Index]
	}
	Return
}
