#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
#SingleInstance force

targetName := "ahk_exe sidebar.exe"
targetHwnd := 0

WinWait, %targetName%, , 30000
If (ErrorLevel == 1)
{
	ExitApp
}
WinGet, targetHwnd, ID, %targetName%
Gosub, ProcessCheck
SetTimer, ProcessCheck, 300000

Return


ProcessCheck:
{
	IfWinNotExist, %targetName%
	{
		ExitApp
	}
	responding := DllCall("User32.dll\SendMessageTimeout", "UInt", targetHwnd, "UInt", 0x0000, "Int", 0, "Int", 0, "UInt", 0x0002, "UInt", 5000, "UInt *", 0)
		; 0 = 응답 없음, 1 = 응답 있음
	If (responding == 0)
	{
		Process, Close, sidebar.exe
		Process, WaitClose, sidebar.exe
		Run, "C:\Program Files\Windows Sidebar\sidebar.exe"
		WinWaitActive, %targetName%, , 5000
		If (ErrorLevel != 1)
		{
			GroupAdd, Group1, %targetName%
			GroupDeactivate, Group1, R
		}
		WinGet, targetHwnd, ID, %targetName%
	}
	Return
}
