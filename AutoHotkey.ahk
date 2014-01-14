; # - windows key
; ^ - control
; +  - shift
; ! - alt

;set hotstrings to work only with TAB
#Hotstring EndChars `t


;key remaps
;Capslock::LWin


;path customization
main_machine := false
dropbox_folder := ""


if(main_machine = true)
{
	dropbox_folder := "c:\dropbox\"
;	Run C:\Program Files\totalcmd\totalcmd64.exe
	Run %dropbox_folder%utilities\bugn\bugn.exe
	Run %dropbox_folder%utilities\winsplit\winsplit.exe
	Run %dropbox_folder%utilities\mouseemu\mousemu.exe
	Run c:\Program Files (x86)\clcl\clcl.exe
	Run c:\Program Files\ConEmu\conemu64.exe 
}
else
{
	dropbox_folder := "c:\dropbox\"
	Run %dropbox_folder%utilities\mouseemu\mousemu.exe
	Run %dropbox_folder%utilities\winsplit\winsplit.exe
	Run c:\Program Files (x86)\clcl\clcl.exe            	
}

;//edit this file
#^+f12:: Edit

;//reload autohotkey config file
#^+f11::
  SoundPlay *64
  Reload
  Sleep 1000
  MsgBox 4, , Script reloaded unsuccessful, open it for editing?
  IfMsgBox Yes, Edit
return


^#F1::Run ::{645ff040-5081-101b-9f08-00aa002f954e}
^#F2::Run control
^#F3::Run control Sysdm.cpl
^#F4::Run control ncpa.cpl
^#F5::Run control appwiz.cpl
^#F6::Run control desk.cpl
^#F7::Run control admintools



^+h::
{	

	if toggle := !toggle
	{
		  WinHide ahk_class Shell_TrayWnd
		  WinHide Start ahk_class Button
	}
	else
	{
		  WinShow ahk_class Shell_TrayWnd
	 	 WinShow Start ahk_class Button
	}
	return
}


^#s::
{
	IfWinExist, ConEmu
	{
		WinActivate
		Return
	}

	Run C:\Program Files\ConEmu\conemu64.exe
	Return
}


^#t::
{
	IfWinExist, TrueCrypt
	{
		 WinActivate  
		 return
	}
	
	Run C:\Program Files\truecrypt\truecrypt.exe
	return
}


^#8::Run C:\Program Files (x86)\Red Gate\SQL Compare 10\RedGate.SQLDataCompare.UI.exe
^#7::Run C:\Program Files (x86)\Red Gate\SQL Compare 10\RedGate.SQLCompare.UI.exe
^#9::Run chrome.exe
^#2::Run opera.exe

^#6::Run C:\Program Files (x86)\JetBrains\WebStorm 7.0\bin\webstorm.exe


^#v::Run C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe /nosplash
^#i::Run iexplore.exe
^#n::Run %dropbox_folder%utilities\sublime\sublime_text.exe
^#a::Run C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio\Ssms.exe
^#g::Run C:\Program Files (x86)\Mozilla Firefox\firefox.exe
^#o::Run C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe
^#w::Run %dropbox_folder%utilities\foobar2000\foobar2000.exe
^#q::Run c:\program files\totalcmd\totalcmd64.exe



;//switch mouse pointer between monitors
^#+NumpadEnter::
{

	CoordMode, Mouse, Screen

	SysGet, monitorCount, MonitorCount
	MouseGetPos, x, y

	Monitors := Object()

	If (monitorCount < 2 || monitorCount > 2)
        return

	Loop, %monitorCount% {
        SysGet, monitor, Monitor, %A_Index%

        Monitors[A_Index, 0] := monitorLeft
        Monitors[A_Index, 1] := monitorRight
        Monitors[A_Index, 2] := monitorRight - monitorLeft
        Monitors[A_Index, 3] := monitorBottom - monitorTop
	}

	If (Monitors[1][0] < Monitors[2][0]) {
        primaryMonitorLeft := Monitors[1][0]
        primaryMonitorRight := Monitors[1][1]
        targetMonitorX := Monitors[1][2]
        targetMonitorY := Monitors[1][3]
        sourceMonitorX := Monitors[2][2]
        sourceMonitorY := Monitors[2][3]
	} Else {
        primaryMonitorLeft := Monitors[2][0]
        primaryMonitorRight := Monitors[2][1]
        targetMonitorX := Monitors[2][2]
        targetMonitorY := Monitors[2][3]
        sourceMonitorX := Monitors[1][2]
        sourceMonitorY := Monitors[1][3]
	}

	If (primaryMonitorLeft < 0) {
        If (x < primaryMonitorRight) {
                MouseMove, (sourceMonitorX / 2), (sourceMonitorY / 2)
        } Else {
                MouseMove, -(targetMonitorX / 2), (targetMonitorY / 2)
        }
		MouseGetPos,,, hwnd 
		WinActivate, ahk_id %hwnd%
	} Else {
        If (x < primaryMonitorRight) {
                MouseMove, (targetMonitorX + (sourceMonitorX / 2)), (sourceMonitorY / 2)
        } Else {
                MouseMove, (targetMonitorX / 2), (targetMonitorY / 2)
        }

		MouseGetPos,,, hwnd 
		WinActivate, ahk_id %hwnd%	
	}


	return

}




;//restart explorer
^+#e::
{
	Run pskill explorer
	Sleep 50
	Run explorer.exe
	return
}


;//restart mousemu
^+#m::
{
	Run pskill mopusemu
	Sleep 50
	Run %dropbox_folder%utilities\mouseemu\mousemu.exe
	return
}

 
;search selected text on google
^+c::
{
	Send, ^c
	Sleep 50
	Run, https://www.google.com/search?q=%clipboard%
	Return
}


;open selected text in browser
^+v::
{
	Send, ^c
	Sleep 50
	Run "iexplore.exe" %clipboard%
	Return
}



;mute 
^+End::
{
	Send {Volume_Mute}
	return
}

;volume up/down
^+PgUp::
{
	Send {Volume_Up}
	return
}


^+PgDn::
{
	Send {Volume_Down}
	return
}

;turn off monitor
^+#s::
{
	;Sleep 1000
	;SendMessage,0x112,0xF170,1,,Program Manager
	run, %dropbox_folder%utilities\nircmd cmdwait 1000 monitor off	
	return
}


;windowed full screen implementation
^+#F1::
{
	WinGet, TempWindowID, ID, A
	If (WindowID != TempWindowID)
	{
	  WindowID:=TempWindowID
	  WindowState:=0
	}
	If (WindowState != 1)
	{
	  WinGetPos, WinPosX, WinPosY, WindowWidth, WindowHeight, ahk_id %WindowID%
	  WinSet, Style, ^0xC40000, ahk_id %WindowID%
	  WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
	}
	Else
	{
	  WinSet, Style, ^0xC40000, ahk_id %WindowID%
	  WinMove, ahk_id %WindowID%, , WinPosX, WinPosY, WindowWidth, WindowHeight
	}
	WindowState:=!WindowState
	return
}

;//select word
+^a::
{
	Send, {LButton 2}^c
	return
}

;//select entire paragraph
+^s::
{
	Send {LButton}
	Send {LButton 2}^c
	return
}


;//always on top switchable
^+#t::
{
    ActiveHwnd := WinExist("A")
    WinGetTitle, WindowTitle, ahk_id %ActiveHwnd%
    WinGet, ExStyle, ExStyle, ahk_id %ActiveHwnd%
    if (ExStyle & 0x8)
        OnTop=1
    else
        OnTop=0
    Winset, AlwaysOnTop, Toggle, ahk_id %ActiveHwnd%

    StringReplace, WindowTitle, WindowTitle, %A_Space%- (Pinned)
    if not OnTop
      WindowTitle:=WindowTitle . " - (Pinned)"

}

;//hotstrings
::tks::
(
Thanks,
Marius
)


