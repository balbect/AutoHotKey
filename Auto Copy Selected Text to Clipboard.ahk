;Blank Template written by GroggyOtter
;https://pastebin.com/mMxi8KEQ

;============================== Start Auto-Execution Section ==============================
; Always run as admin
if not A_IsAdmin
{
	Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
	ExitApp
}

; Keeps script permanently running
#Persistent

; Determines how fast a script will run (affects CPU utilization).
; The value -1 means the script will run at it's max speed possible.
SetBatchLines, -1

; Avoids checking empty variables to see if they are environment variables.
; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv

; Ensures that there is only a single instance of this script running.
#SingleInstance, Force

; Makes a script unconditionally use its own folder as its working directory.
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%

; sets title matching to search for "containing" instead of "exact"
SetTitleMatchMode, 2

GroupAdd, saveReload, %A_ScriptName%

return

;============================== Save Reload / Quick Stop ==============================
#IfWinActive, ahk_group saveReload

; Use Control+S to save your script and reload it at the same time.
~^s::
TrayTip, Reloading updated script, %A_ScriptName%
SetTimer, RemoveTrayTip, 1500
Sleep, 1750
Reload
return

; Removes any popped up tray tips.
RemoveTrayTip:
SetTimer, RemoveTrayTip, Off 
TrayTip 
return 

; Hard exit that just closes the script
^Esc::
ExitApp


#IfWinActive
;============================== Main Script ==============================
; https://autohotkey.com/board/topic/5139-auto-copy-selected-text-to-clipboard/


;Auto copy clipboard
~Lshift::
TimeButtonDown = %A_TickCount%
; Wait for it to be released
Loop
{
   Sleep 10
   GetKeyState, LshiftState, Lshift, P
   if LshiftState = U  ; Button has been released.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonDown%
   if elapsed > 200  ; Button was held down long enough
   {
      x0 = A_CaretX
      y0 = A_CaretY
      Loop
   {
     Sleep 20                    ; yield time to others
     GetKeyState keystate, Lshift
     IfEqual keystate, U, {
       x = A_CaretX
       y = A_CaretY
       break
     }
   }
   if (x-x0 > 5 or x-x0 < -5 or y-y0 > 5 or y-y0 < -5)
   {                             ; Caret has moved
      clip0 := ClipBoardAll      ; save old clipboard
      ;ClipBoard =
      Send ^c                    ; selection -> clipboard
      ClipWait 1, 1              ; restore clipboard if no data
      IfEqual ClipBoard,, SetEnv ClipBoard, %clip0%
   }
      return
   }
}

~LButton::
MouseGetPos, xx
TimeButtonDown = %A_TickCount%
; Wait for it to be released
Loop
{
   Sleep 10
   GetKeyState, LButtonState, LButton, P
   if LButtonState = U  ; Button has been released.
   {
      If WinActive("Crimson Editor") and (xx < 25) ; Single Click in the Selection Area of CE
      {
         Send, ^c
         return
      }
      break
   }
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonDown%
   if elapsed > 200  ; Button was held down too long, so assume it's not a double-click.
   {
      MouseGetPos x0, y0            ; save start mouse position
      Loop
   {
     Sleep 20                    ; yield time to others
     GetKeyState keystate, LButton
     IfEqual keystate, U, {
       MouseGetPos x, y          ; position when button released
       break
     }
   }
   if (x-x0 > 5 or x-x0 < -5 or y-y0 > 5 or y-y0 < -5)
   {                             ; mouse has moved
      clip0 := ClipBoardAll      ; save old clipboard
      ;ClipBoard =
      Send ^c                    ; selection -> clipboard
      ClipWait 1, 1              ; restore clipboard if no data
      IfEqual ClipBoard,, SetEnv ClipBoard, %clip0%
   }
      return
   }
}
; Otherwise, button was released quickly enough.  Wait to see if it's a double-click:
TimeButtonUp = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, LButtonState, LButton, P
   if LButtonState = D  ; Button has been pressed down again.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonUp%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a double-click.
      return
}

;Button pressed down again, it's at least a double-click
TimeButtonUp2 = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, LButtonState2, LButton, P
   if LButtonState2 = U  ; Button has been released a 2nd time, let's see if it's a tripple-click.
      break
}
;Button released a 2nd time
TimeButtonUp3 = %A_TickCount%
Loop
{
   Sleep 10
   GetKeyState, LButtonState3, LButton, P
   if LButtonState3 = D  ; Button has been pressed down a 3rd time.
      break
   elapsed = %A_TickCount%
   elapsed -= %TimeButtonUp%
   if elapsed > 350  ; No click has occurred within the allowed time, so assume it's not a tripple-click.
   {  ;Double-click
      Send, ^c
      return
   }
}
;Tripple-click:
Sleep, 100
Send, ^c
return

~^a::Send, ^c ;Ctl+A = Select All, then Copy





;============================== Program 1 ==============================
; Evertything between here and the next #IfWinActive will ONLY work in someProgram.exe
; This is called being "context sensitive"
; #IfWinActive, ahk_exe someProgram.exe



; #IfWinActive
;============================== ini Section ==============================
; Do not remove /* or */ from this section. Only modify if you're
; storing values to this file that need to be permanantly saved.
/*
	[SavedVariables]
	Key=Value
*/
;============================== GroggyOtter ==============================
;============================== End Script ==============================