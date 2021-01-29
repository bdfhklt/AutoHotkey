#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; #MaxThreads, 5
#Persistent
; 동시실행
; SetTimer, t1, 3000 ; 가능, 따로 실행해도 동시에 실행이 되는 타이밍에 충돌(지연됨, Run 제외)
; SetTimer, t2, 3000
; SetTimer, t3, 3000
; Run, MsgBox.ahk ; 가능, 순간 렉으로 동시에 실행 안될 수 있음
; Run, MsgBox.ahk
; Run, MsgBox.ahk
; Gosub, t1 ; 불가
; Gosub, t2
; Gosub, t3
Return


t1:
{
	; Run, MsgBox.ahk
	MsgBox, 0, , t1, 2
	Return
}

t2:
{
	; Run, MsgBox.ahk
	MsgBox, 0, , t2, 2
	Return
}

t3:
{
	; Run, MsgBox.ahk
	MsgBox, 0, , t3, 2
	Return
}