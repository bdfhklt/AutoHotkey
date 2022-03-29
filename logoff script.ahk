#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 윈도우 10 GPO 로그오프 스크립트
; ! 로그오프시 프로세스가 바로 강제 종료되어 적용 불가 !

#SingleInstance ignore
DetectHiddenWindows, On

global processList := [] ; 종료할 프로세스 리스트

; utorrent(μTorrent)
; win1 := "μTorrent"
; process1 := "uTorrent.exe"

; IfWinExist, % win1
; {
; 	processList.Push(process1)

; 	WinClose, % win1
; 	ControlSend, , {Enter}, % win1
; 	; OutputDebug, % "win close: " win1
; }


; VirtualBox Headless
; process1 := "VBoxHeadless.exe"

; Process, Exist, % process1
; If (ErrorLevel != 0)
; {
; 	processList.Push(process1)

; 	listFilePath := ".\runningvms.txt"

; 	RunWait, % "powershell ""C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe list runningvms | Out-File -FilePath " listFilePath """"
; 		; 실행 중인 vm 리스트 저장
; 	Loop, Read, % listFilePath
; 	{
; 		vmName := ""

; 		RegExMatch(A_LoopReadLine, """.+""", vmName) ; 이름만 추출
; 		; OutputDebug, % vmName

; 		RunWait, % "powershell ""C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe controlvm '" vmName "' savestate""" ; 상태 저장
; 	}
; 	FileDelete, % listFilePath
; }


WaitAllClose()
Sleep, 2000

ExitApp


WaitAllClose()
{
	Loop, % processList.Length()
	{
		; OutputDebug, % "wait close: " processList[A_Index]
		Process, WaitClose, % processList[A_Index]
	}
	Return
}
