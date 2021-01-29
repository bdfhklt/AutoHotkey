#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

gui, show, w1920 h1080 x-3 y-26
gui, +AlwaysOnTop
gui, color, 000000

return


GuiClose:
ExitApp