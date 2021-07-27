#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; 기본 재생장치 스왑
windname := "소리"
;~ ctrlname := "기본값으로 설정"
;~ chckname := "확인"
firstDevice := 1
nextDevice := 1
t4 := 1
;~ t5 :=
;IniRead, , config
DetectHiddenWindows, on
Run, mmsys.cpl
WinWait, %windname%
;~ WinSet, Bottom, , %windname%
WinHide, %windname%
;~ WinActivate, %windname%
ControlSend, SysListView321, {Down %firstDevice%}, %windname%
ControlGet, isEnabled, Enabled, , Button2, %windname% ; Button2: 기본값으로 설정 버튼
if !(isEnabled)
{
	ControlSend, SysListView321, {Down %nextDevice%}
	t4 += 1
}
ControlClick, Button2, %windname%
ControlClick, Button4, %windname%
;~ WinShow, %windname%
WinWaitClose, %windname%
SoundPlay, *-1, wait
;~ if (t4 = 1)
;~ {
	;~ t5 := "Headphone"
;~ }
;~ else if (t4 = 2)
;~ {
	;~ t5 := "Speaker"
;~ }
;~ MsgBox, , %t5%, - %t5% -, 1
return

/*