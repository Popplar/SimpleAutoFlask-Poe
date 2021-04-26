;----------------------------------------------------------------------
; PoE Flasks macro for AutoHotKey
;----------------------------------------------------------------------
#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv  
#Warn  
#Persistent
SendMode Input

If (Not A_IsAdmin) {
    try {
        Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
        ExitApp
    }
}
;----------------------------------------------------------------------
; Setting Flasks X,Y coordinates (Used to check if color on that pixel changed to ensure usage of Flask).
;----------------------------------------------------------------------
FlaskInit := []
;----------------------------------------------------------------------
; Initialize Script (F2 to start).
;----------------------------------------------------------------------
Enabled := false

RemoveToolTip:
	ToolTip
	return

F2::
	Enabled := not Enabled
	Hotkey, IfWinActive, Path of Exile
	Hotkey, ~q,% Enabled?"On":"Off"
	Hotkey, ~w,% Enabled?"On":"Off"
	
	if Enabled {
		; initialize start of auto-flask use
		ToolTip, UseFlasks On
        SetTimer, RemoveToolTip, -1000
		FlaskInit[1] := new Flask(0, 0) ; I use Life Flask in here, 0,0 = disabled.
		FlaskInit[2] := new Flask(360, 1074)
		FlaskInit[3] := new Flask(405, 1074)
		FlaskInit[4] := new Flask(450, 1074)
		FlaskInit[5] := new Flask(495, 1074)
	} else {
		ToolTip, UseFlasks Off
        SetTimer, RemoveToolTip, -1000
	}
	return
;----------------------------------------------------------------------
; Main program - basics are that we use flasks whenever flask
; usage is enabled via hotkey (default is q and w) and we've attacked
; (channeling or continuous attacking).
;----------------------------------------------------------------------
~q::
~w::
	Gosub, CycleAllFlasksWhenReady
	return

CycleAllFlasksWhenReady:
	for index, item in FlaskInit {
		PixelGetColor, tempColor, item.x, item.y
		if ((tempColor = item.color) And Not (item.x = 0)) {
			SendInput %index%
		}
	}
	return
;----------------------------------------------------------------------
; Class Flask.
;----------------------------------------------------------------------
class Flask {
	__New(CoordX, CoordY) {
		this.x := CoordX
		this.y := CoordY
		PixelGetColor, defaultColor, CoordX, CoordY
		this.color := defaultColor
	}
}
