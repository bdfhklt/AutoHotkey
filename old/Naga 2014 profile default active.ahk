#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Ignore ; 중복 실행 무시

Loop, Files, C:\ProgramData\Razer\Synapse\Accounts\AM_1027231\Devices\Naga 2014\Profiles\*.xml
{
	FileRead, tmp1, %A_LoopFileFullPath%
	If InStr(tmp1, "<ProfileName>" , , 0) ; 0: 역순으로 찾기 시작
	{
		If InStr(tmp1, "<ProfileName>01" , , 0)
		{
			StrReplace(tmp1, "<Active>0</Active>" , "<Active>1</Active>", 1)
			continue
		}
		tmp1 := StrReplace(tmp1, "<Active>1</Active>" , "<Active>0</Active>", 1)
		tmp2 := % A_LoopFileFullPath . ".tmp"
		FileMove, %A_LoopFileFullPath%, % A_LoopFileFullPath . ".tmp"
		FileAppend, %tmp1%, %A_LoopFileFullPath%
		FileDelete, % A_LoopFileFullPath . ".tmp"
	}
}

ExitApp