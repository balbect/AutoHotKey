﻿
#SingleInstance, force

^!p::Pause    ; Pause script with Ctrl+Alt+P
^!s::Suspend  ; Suspend script with Ctrl+Alt+S
^!r::Reload   ; Reload script with Ctrl+Alt+R


f1::
clipboard := "" 					; clears the clipboard
mouseclick, left, 693, 578,2,0 		; change thus variable to (click,xxx,yyy)
sleep, 100
send ^c 					
ClipWait
Parent_AGI := clipboard 				; stores the clipboard content into a variable

sleep 500

clipboard :=
mouseclick, left, 691, 603, 2, 0
sleep, 100
send ^c
ClipWait
Stu_AGI := clipboard 	

sleep 500

clipboard :=
mouseclick, left, 512, 553, 2, 0
sleep, 100
send, ^c
ClipWait,1,0
Indep_HH_Size := clipboard 

sleep 500

clipboard :=
mouseclick, left, 278, 551, 2, 0
sleep, 100
send, ^c
ClipWait,1,0
Dep_HH_Size := clipboard 


if (Parent_AGI > 18210) or (Stu_AGI > 18210) and (Indep_HH_Size = 1) or (Dep_HH_Size = 1){
	msgbox,,, Studnet AGI (%Stu_AGI%) or Parent AGI (%Parent_AGI%) is greater than the $19,210 dollar maximum for an Independent/Dependendent Household of 1.

else if (Parent_AGI > 24690) or (Stu_AGI > 24690) and (Indep_HH_Size = 2) or (Dep_HH_Size = 2)
{
	msgbox,,, Studnet AGI (%Stu_AGI%) or Parent AGI (%Parent_AGI%) is greater than the $24,690 dollar maximum for an Independent/Dependendent Household of 2.
}


;else if (Parent_AGI > 31170) or (Stu_AGI > 31170) and (Indep_HH_Size = 3) or (Dep_HH_Size = 3)

;else if (Parent_AGI > 37650) or (Stu_AGI > 37650) and (Indep_HH_Size = 4) or (Dep_HH_Size = 4)

;else if (Parent_AGI > 44130) or (Stu_AGI > 44130) and (Indep_HH_Size > 5) or (Dep_HH_Size > 5)

;else if (Parent_AGI > 50610) or (Stu_AGI > 50610) and (Indep_HH_Size > 6) or (Dep_HH_Size > 6)

;else if (Parent_AGI > 57090) or (Stu_AGI > 57090) and (Indep_HH_Size > 7) or (Dep_HH_Size > 7)

;else if (Parent_AGI > 63570) or (Stu_AGI > 63570) and (Indep_HH_Size > 8) or (Dep_HH_Size > 8)

}
return 
