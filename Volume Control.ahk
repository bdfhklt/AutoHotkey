#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

; 핫키를 특정 프로그램에서도 사용 가능하나 반대로 다른 특정 프로그램에서 사용 불가
; #InstallKeybdHook
; #UseHook, On

Gui, -Caption +ToolWindow
Gui, Color, c000000
Gui, Font, s11 q5 cFFFFFF, Segoe UI
Gui, add, Progress, x20 y20 w20 h100 Vertical c1F7F3F vProgress1, 100
Gui, add, Text, x18 y125 Center vText1, 100
Gui, Show, x100 y100 w60 h160 Hide
; 문제점: 특정 전체화면 프로그램에서 알트탭처럼 바탕화면으로 강제 화면 전환 발생
ShowGui()

Return


Volume_Up::
{
	; SoundSet, +5
	VolumeControl(5)
	ShowGui()
	Return
}
Volume_Down::
{
	; SoundSet, -5
	VolumeControl(-5)
	ShowGui()
	Return
}

VolumeControl(controlValue)
{
	SoundGet, volumeValue
	SoundSet, Round(Round((volumeValue + controlValue) * 2, -1) / 2) ; 5의 배수
	Return
}

ShowGui()
{
	SoundGet, volumeValue ; 0.000000 ~ 100.000000
	volumeValue := Round(volumeValue) ; 정수로 반올림 (+ 오차 값(±0.0000XX) 제거)
	GuiControl, , Progress1 , %volumeValue%
	GuiControl, , Text1 , %volumeValue%
	Gui, Show, NoActivate
	WinSet, AlwaysOnTop, On, %A_ScriptName% ; Gui 옵션이 적용 안될 때가 있어서 대체
	SetTimer, HideGui, -800
	Return
}
HideGui:
{
	Gui, Hide
	Return
}
