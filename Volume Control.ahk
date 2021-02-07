#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance ignore
Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Color, c000000
Gui, Font, s11 q5 cFFFFFF, 맑은 고딕
Gui, add, Progress, x20 y20 w20 h100 Vertical c1F7F3F vProgress1, 100
Gui, add, Text, x18 y125 Center vText1, 100
Gui, Show, x100 y100 w60 h160 Hide
ShowGui()
Return

Volume_Up::
{
	SoundSet, +5
	ShowGui()
	Return
}
Volume_Down::
{
	SoundSet, -5
	ShowGui()
	Return
}

ShowGui()
{
	SoundGet, volumeValue ; 0.000000 ~ 100.000000
	volumeValue := Round(volumeValue) ; 정수로 반올림 (+ 오차 값(±0.0000XX) 제거)
	GuiControl, , Progress1 , %volumeValue%
	GuiControl, , Text1 , %volumeValue%
	Gui, Show, NoActivate
	SetTimer, HideGui, -800
	Return
}
HideGui:
{
	Gui, Hide
	Return
}
