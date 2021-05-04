#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
#SingleInstance force

DetectHiddenWindows, On

global targetList :=
(LTrim Join
{
	checkList:
	[
		{
			title: "ahk_exe sidebar.exe",
			process: "sidebar.exe",
			path: "C:\Program Files\Windows Sidebar\sidebar.exe"
		}
	],
	closeList:
	[
		{
			target: "kited.exe",
			check: "Code.exe"
		}
	]
}
)

Gosub, Execution
SetTimer, Execution, 300000

Return

Execution:
{
	For index, item in targetList.checkList
	{
		WindowCheck(item.title, item.process, item.path)
	}
	For index, item in targetList.closeList
	{
		ProcessClose(item.target, item.check)
	}
	Return
}

WindowCheck(targetTitle, targetProcess, targetPath)
{
	IfWinNotExist, %targetTitle%
	{
		Return
	}
	; If (targetHwnd)
	WinGet, targetHwnd, ID, %targetTitle%
	responding := DllCall("User32.dll\SendMessageTimeout", "UInt", targetHwnd, "UInt", 0x0000, "Int", 0, "Int", 0, "UInt", 0x0002, "UInt", 5000, "UInt *", 0)
		; 0 = 응답 없음, 1 = 응답 있음
	If (responding != 0)
	{
		Return
	}
	Process, Close, %targetProcess%
	Process, WaitClose, %targetProcess%
	Run, %targetPath%
	WinWaitActive, %targetTitle%, , 5
	If (ErrorLevel != 1)
	{
		GroupAdd, Group1, %targetTitle%
		GroupDeactivate, Group1, R
	}
	Return
}

ProcessClose(targetProcess, checkProcess)
{
	Process, Exist, %targetProcess%
	If (ErrorLevel == 0) { ; 0 = 없음
		Return
	}
	Process, Exist, %checkProcess%
	If (ErrorLevel != 0) {
		Return
	}
	Process, Close, %targetProcess%
	Return
}
