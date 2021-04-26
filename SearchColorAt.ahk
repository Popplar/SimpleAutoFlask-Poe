;----------------------------------------------------------------------
; Search cursor coordinates and color at specific pixel using the cursor.
;
; Keys used and monitored:
; F3: Activate script.
; a: Function, get color at specificed pixel using the cursor.
;----------------------------------------------------------------------
#IfWinActive, Path of Exile ahk_class POEWindowClass
#SingleInstance force
#NoEnv  
#Warn  
#Persistent
SendMode Input

Enabled := false

RemoveToolTip:
ToolTip
return

F3::
	Enabled := not Enabled
	if Enabled {
		ToolTip, SearchColorAt On
		SetTimer, RemoveToolTip, -1000
	} else {
		ToolTip, SearchColorAt Off
		SetTimer, RemoveToolTip, -1000
	}
	return

a::
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color, %MouseX%, %MouseY%
	CoordenadasX := MouseX
	CoordenadasY := MouseY
	Datos := CoordenadasX ":" CoordenadasY ":" color
	Clipboard := Datos
	MsgBox Current cursor position X: %CoordenadasX% Y: %CoordenadasY%. Color at current cursor position: %color%. Position and color has been saved to the clipboard.
	return