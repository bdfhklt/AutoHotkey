#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Msgbox % GenerateRandomString(10)

GenerateRandomString(length) {

characters := "abcdefghijklmnopqurstuvwxyz"
StringSplit, chars, characters

Loop, %length%
{
   Random, rand, 1, 26
   password .= chars%rand%
}
return password
}