#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

sleep, 2000
TrayTip, test title, test text 
sleep, 8000


/*
TrayTip, My Title, Multiline`nText, 20, 17

; (현재 쓰레드를 멈추는) Sleep을 사용할 필요 없이
; 보여주는 시간을 더 정밀하게 제어하려면:
#Persistent


SetTimer, RefreshTrayTip, 1000
Gosub, RefreshTrayTip  ; 한 번만 호출하면 즉시 시작합니다.
return

RefreshTrayTip:
TrayTip, Refreshed TrayTip, 이것은 거의 영구적인 TrayTip입니다., , 16
return

ExitApp