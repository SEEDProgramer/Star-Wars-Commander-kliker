#include <Constants.au3>
#include <MsgBoxConstants.au3>


;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jonathan Bennett (jon at autoitscript dot com)
;
; Script Function:
; Zbieraz zloto i metal i zapobiega wylogowaniu z powodu braku aktywności
; Jezeli skrypt ma nie działać wystarczy ze powiększymy grę na cały ekran (bez belki)

Global $g_bPaused = False

HotKeySet("{PAUSE}", "HotKeyPressed")
HotKeySet("{ESC}", "HotKeyPressed")
HotKeySet("+!p", "HotKeyPressed") ; Shift-Alt-p

; Prompt the user to run the script - use a Yes/No prompt with the flag parameter set at 4 (see the help file for more details)
Local $iAnswer = MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "Star Wars Commander", "This is a gold and aloy collektor.Press Shift-Alt-p for pause, ECS to terminate.  Do you want to run it?")

; Check the user's answer to the prompt (see the help file for MsgBox return values)
; If "No" was clicked (7) then exit the script
If $iAnswer = 7 Then
	MsgBox($MB_SYSTEMMODAL, "Star Wars", "OK.  Bye!")
	Exit
EndIf

; Actiwate game window
;WinActivate("Star Wars: Commander")

; Wait for the calculator to become active. The classname "CalcFrame" is monitored instead of the window title
;WinWaitActive("Star Wars: Commander")

; Now that the calculator window is active type the values 2 x 4 x 8 x 16
; Use AutoItSetOption to slow down the typing speed so we can see it
;AutoItSetOption("SendKeyDelay", 400)
;Send("2*4*8*16=")
Local $i = 0
Local $aMgp = 0
While($i<2000) ; jak narazie klika 2000 razy do czasu opracowania gorącego klawisza działa 100godzin
	ToolTip("Collector is runing " & $i & " times!!! Now is hunting time",837,744) ; powiadamianie na pasku
	CollectAll()
	MouseClick($MOUSE_CLICK_LEFT,100,1) ; aby ukryć okno z grą
	;MsgBox($MB_SYSTEMMODAL, "", "Value of $i is: " & $i)
	$i = $i + 1
	; Assign a Local variable the coords the cursor (array).
	Local $a = 180000 ;3 minuty
	While ($a > 0)
		;WinSetTitle ("Star Wars: Commander","","Star Wars: Commander Collector is runing !!! Time to start: " & $a)
		;If WinActive("Star Wars: Commander") Then

		;Else
			If $a < 5000 Then
				$aMgp = MouseGetPos()
				; Display a tooltip near the cursor with its coords.
				ToolTip("SW_Col to go " & $a , $aMgp[0] + 10, $aMgp[1] + 10) ; wyświetlamy informację na 5 s przed zadziałaniem klikacza
			Else
				ToolTip("Collector is runing " & $i & " times!!! Time to next collect: " & $a,837,744) ; powiadamianie na pasku
			EndIf
		;EndIf
		Sleep(500)
		$a = $a - 500
	WEnd
	ToolTip("") ; Ukrywa informacje
	;Sleep(180000) ;3 minuty
WEnd

; Now quit by sending a "close" request to the calculator window using the classname
;WinClose("[CLASS:CalcFrame]")

; Now wait for the calculator to close before continuing
;WinWaitClose("[CLASS:CalcFrame]")
Func CollectAll()
	WinActivate("Star Wars: Commander")
	WinWaitActive("Star Wars: Commander")
	Collect(582,146) ;gold1
	Collect(499,170) ;gold2
	Collect(561,206) ;gold3
	Collect(493,236) ;gold4
	Collect(308,331) ;gold5
	Collect(287,393) ;aloy1
	Collect(396,406) ;aloy2
	Collect(457,450) ;aloy3
	Collect(524,485) ;aloy4
	Collect(895,536) ;aloy5
	;MouseClick($MOUSE_CLICK_LEFT,582,146) ; gold 1
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,499,170) ; gold 2
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,561,206) ; gold 3
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,493,236) ; gold 4
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,308,331) ; gold 5
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,287,393) ; aloy 1
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,396,406) ; aloy 2
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,457,450) ; aloy 3
	;Sleep($iMmousedelay)
	;MouseClick($MOUSE_CLICK_LEFT,524,485) ; aloy
EndFunc
Func Collect($vX = 0, $vY = 0)
	MouseClick($MOUSE_CLICK_LEFT,$vX,$vY) ; gold 1
	Sleep(100) ; delay między klikami zeby gra zdazyła zatrybic
EndFunc

; Obsluga hotkeyow (pauza i zakończenie)
Func HotKeyPressed()
	Switch @HotKeyPressed ; The last hotkey pressed.
		Case "+!p" ; String is the {PAUSE} hotkey.
			$g_bPaused = Not $g_bPaused
			While $g_bPaused
				Sleep(100)
				ToolTip('Script is "Paused"', 837,744)
			WEnd
			ToolTip("")

		Case "{ESC}" ; String is the {ESC} hotkey.
			Exit

		Case "+!d" ; String is the Shift-Alt-d hotkey.
			;MsgBox($MB_SYSTEMMODAL, "", "This is a message.")

	EndSwitch
EndFunc   ;==>HotKeyPressed
; Finished!
