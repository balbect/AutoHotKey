
^!p::Pause    ; Pause script with Ctrl+Alt+P
^!s::Suspend  ; Suspend script with Ctrl+Alt+S
^!r::Reload   ; Reload script with Ctrl+Alt+R


f1::
clipboard := "" 					; clears the clipboard
mouseclick, left, 693, 578,2,0 		; change thus variable to (click,xxx,yyy)
sleep 100
send ^c 					
ClipWait
Parent_AGI_total := clipboard 		; stores the clipboard content into a variable

sleep 500

clipboard :=
mouseclick, left, 691, 603, 2, 0
sleep 100
send ^c
ClipWait
Stu_AGI_total := clipboard 	

sleep 500

clipboard :=
mouseclick, left, 512, 553, 2, 0
sleep 100
send, ^c
ClipWait,1,
Indep_HH_Size := clipboard 

sleep 500

clipboard :=
mouseclick, left, 278, 551, 2, 0
sleep 100
send, ^c
ClipWait,1,
Dep_HH_Size := clipboard 


if (Parent_AGI_total > 18210) or (Stu_AGI_total > 18210) and (Indep_HH_Size > 1) or (Dep_HH_Size > 1)
{
	msgbox,,, Studnet AGI Total (%Stu_AGI_total%) is greater than the 19210 dollar maxium for and Independent Household of %Indep_HH_Size% or Dependendent Household of %Dep_HH_Size%
}

return 
