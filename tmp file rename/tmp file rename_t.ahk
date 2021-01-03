#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileEncoding , UTF-8

Gui, Show, w800 h800, Untitled GUI
Gui, Add, ListView, x0 y0 w800 h740 Grid -ReadOnly gLV1 vLV1, n|list
Gui, Add, Edit, x10 y750 w400 -Multi ReadOnly vedit1, 
Gui, Add, ComboBox, x10 y770 w200 vcbBox1, Ep||Sp|etc
Gui, Add, CheckBox, x230 y770 w20 h20 gchckBox1 vchckBox1, 
GuiControl, , chckBox1, 1
chckBox1 := 1
Gui, Add, Edit, x250 y770 w60
Gui, Add, UpDown, Range0-100 vupDown1, 1
Menu, LV1Menu, Add, Run, LV1MenuRun
Menu, LV1Menu, Add, Delete, LV1MenuDelete
Menu, LV1Menu, Add, Rename, LV1MenuRename

return


GuiClose:
GuiEscape:
ExitApp


GuiDropFiles:
tmp1 := A_GuiEvent
IfInString, tmp1, `n
{
	StringGetPos, tmp2, tmp1, `n, L1
	StringTrimRight, tmp1, tmp1, StrLen(tmp1) - tmp2
}
StringGetPos, tmp2, tmp1, \, R1
StringTrimRight, tmp1, tmp1, StrLen(tmp1) - tmp2
tmp1 .= "\"
GuiControl, , edit1, %tmp1%
SetWorkingDir, %tmp1% ; 작업 디렉토리 변경
tmp2 := A_GuiEvent
tmp2 := StrReplace(tmp2, tmp1)
IfInString, tmp2, .txt ; txt파일 드롭
{
	Loop, read, %tmp2%
	{
		tmp1 := StrSplit(A_LoopReadLine, A_Tab)
		LV_Add(, tmp1[1], tmp1[2]) ; 로 추가
		LV_ModifyCol()
	}
}
else ; 일반 파일 드롭
{
	sort, tmp2
	GuiControlGet, tmp1, , cbBox1
	GuiControlGet, tmp3, , upDown1
	Loop, parse, tmp2, `n
	{
		StringGetPos, tmp4, A_LoopField, ., R1
		StringTrimRight, tmp4, A_LoopField, StrLen(A_LoopField) - tmp4
		if(chckBox1)
		{
			LV_Add(, format("{2}{1:02}", tmp3, tmp1), tmp4) ; 로 추가
		}
		else
		{
			LV_Add(, tmp1, tmp4) ; 로 추가
		}
		tmp3++
	}
	LV_ModifyCol() ; 칼럼 리사이징
}
return


chckBox1:
GuiControlGet, chckBox1, , chckBox1
return


LV1:
if(A_GuiEvent == "D" && LV_GetCount("Selected") = 1)
{
	tmp1 := 1
	Hotkey, LButton Up, trigger, On
	MouseGetPos, , tmp2 ; 초기 좌표
	tmp4 := LV_GetNext() ; 초기 위치
	while(tmp1 && LV_GetCount("Selected") = 1)
	{
		MouseGetPos, , tmp3 ; 현재 좌표
		tmp5 := LV_GetNext() ; 현재 위치
		tmp6 := tmp4 + format("{1:0.f}", (tmp3 - tmp2) / 16) ; 이동 위치
		if(tmp6 > tmp5)
		{
			tmp6 := tmp5 + 1
		}
		else if(tmp6 < tmp5)
		{
			tmp6 := tmp5 - 1
		}
		if(tmp5 != tmp6 && tmp6 > 0 && tmp6 <= LV_GetCount())
		{
			LV_GetText(tmp7,  tmp5, 1) ; 로 백업, 변경
			LV_GetText(tmp8,  tmp5, 2)
			LV_GetText(tmp9,  tmp6, 1)
			LV_GetText(tmp10, tmp6, 2)
			LV_Modify(tmp6, "Select", tmp7, tmp8)
			LV_Modify(tmp5, "-Select", tmp9, tmp10)
		}
	}
}
else if(A_GuiEvent == "e")
{
	LV_ModifyCol()
}
return


trigger:
Hotkey, LButton Up, trigger, Off
tmp1 := 0
return


LV1MenuRun:
fileApnd := ""
loop, % LV_GetCount()
{
	LV_GetText(tmp1, A_Index, 1)
	LV_GetText(tmp2, A_Index, 2)
	fileApnd .= tmp1 A_Tab tmp2 "`n"
}
FileDelete, tmpName.txt
Sleep, 100
FileAppend, %fileApnd%, tmpName.txt
;SoundPlay, C:\Windows\Media\Windows Ding.wav, Wait
FileCreateDir, tmpName
loop, Files, *
{
	tmp3 := A_LoopFileName
	tmp4 := A_LoopFileName
	loop, % LV_GetCount()
	{
		LV_GetText(tmp1, A_Index, 1)
		LV_GetText(tmp2, A_Index, 2)
		IfInString, tmp3, %tmp1%
		{
			tmp3 := StrReplace(tmp3, tmp1)
			StringGetPos, tmp1, tmp3, ., R1
			StringTrimRight, tmp3, tmp3, StrLen(tmp3) - tmp1
			FileMove, %tmp4%, tmpName\%tmp3%%tmp2%.*
		}
		else IfInString, tmp3, %tmp2%
		{
			tmp3 := StrReplace(tmp3, tmp2)
			StringGetPos, tmp2, tmp3, ., R1
			StringTrimRight, tmp3, tmp3, StrLen(tmp3) - tmp2
			FileMove, %tmp4%, tmpName\%tmp3%%tmp1%.*
		}
	}
}
FileMove, tmpName\*, *
if(!ErrorLevel)
{
	FileRemoveDir, tmpName
}
return


Fn1()
{
	
}


GuiContextMenu:
if(A_GuiControl = "LV1")
{
	;Gui, ListView, LV1
	if(LV_GetCount())
	{
		Menu, LV1Menu, enable, Run
		Menu, LV1Menu, enable, Delete
	}
	else
	{
		Menu, LV1Menu, disable, Run
		Menu, LV1Menu, disable, Delete
	}
	if(LV_GetNext())
	{
		Menu, LV1Menu, enable, Rename
	}
	else
	{
		Menu, LV1Menu, disable, Rename
	}
	Menu, LV1Menu, show
}
return


LV1MenuDelete:
if(LV_GetNext())
{
	while(LV_Delete(LV_GetNext())) ; 로 제거
	{
	}
}
else
{
	LV_Delete()
}
return


LV1MenuRename:
if(LV_GetNext())
{
	GuiControlGet, tmp1, , cbBox1
	GuiControlGet, tmp2, , UpDown1
	loop, % LV_GetCount("Selected")
	{
		if(chckBox1)
		{
			
			LV_Modify(LV_GetNext(), , format("{1}{2:02}", tmp1, tmp2)) ; 로 변경
		}
		else
		{
			LV_Modify(LV_GetNext(), , tmp1) ; 로 변경
		}
		LV_Modify(LV_GetNext(), "-Select")
		tmp2++
	}
	LV_ModifyCol() ; 칼럼 리사이징
}