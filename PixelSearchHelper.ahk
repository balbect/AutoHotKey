#SingleInstance,Force
OnMessage(0x201,"Check_Hit")
global Rad1:=,Rad2:=,Speed:=1,THWND:=,Target1:=,Click_Count:=0,Target:={}
BackGround_Color:="ffffff",Target.x:=20,Target.y:=40,Target.w:=15,Target.h:=15,Target_Width:=Target.w
Target_Height:=Target.h,Target.Color:="22aaff",Target.Dir:=2,Target.Timer:=0
Gui,1: +OwnDialogs ;+AlwaysOnTop
Gui,1:Color,Black,Black
Gui,1:Font,cRed s22 Bold Q4
Gui,1:Add,Text, x10 y5 w680 Center vClick_Count,Count: %Click_Count%
Gui,1:Font,
Gui,1:Add,Progress,x20 y40 w660 h330 Background%BackGround_Color% vThe_BackGround
Gui,1:Add,Progress,% "x" Target.x " y"Target.y " w" Target.w " h" Target.h " Background" Target.Color " vTarget1",
GuiControlGet,THwnd,HWND,Target1
Gui,1:Add,Groupbox,cTeal x20 y385 w120 h100 ,Mode
Gui,1:Add,Radio,cLime x35 y415 Checked vRad1 gSubmit_All,Click Mode
Gui,1:Add,Radio,cLime x35 yp+25 vRad2 gSubmit_All,Move Mode
Gui,1:Add,Groupbox,cTeal x160 y385 w520 h100 ,Options
Gui,1:Add,Text,cLime x175 y410 ,Target Color:
Gui,1:Add,Edit,cWhite x+5 yp-2 w80 h20 Center vNew_Target_Color gSubmit_All,% Target.Color
Gui,1:Add,Text,cLime x+20 yp+2 ,Target Speed:
Gui,1:Add,Edit,cWhite x+5 yp-2 w80 h20 Center Number vSpeed gSubmit_All,% Speed
Gui,1:Add,Text,cLime x+20 yp+2 ,Target Width:
Gui,1:Add,Edit,cWhite x+5 yp-2 w80 h20 Center Number vTarget_Width gSubmit_All,% Target.w
Gui,1:Add,Text,cLime x175 y450 ,Background Color:
Gui,1:Add,Edit,cWhite x+5 yp-2 w80 h20 Center vNew_BackGround_Color gSubmit_All,% BackGround_Color
Gui,1:Add,Text,cLime x+20 yp+2 ,Target Height:
Gui,1:Add,Edit,cWhite x+5 yp-2 w80 h20 Center Number vTarget_Height gSubmit_All,% Target.h
Gui,1:Add,Button,x+20 w131 h20 gReload ,Reload
Gui,1:Show,w700 h500,Target
Gui,1:Submit,NoHide
return
GuiClose:
	ExitApp
Reload:
	Reload
Submit_All:
	Gui,1:Submit,NoHide
	if(Rad2=1)
		SetTimer,Move_Target,10
	else
		SetTimer,Move_Target,Off
	GuiControl,1: +Background%New_Target_Color%,Target1
	GuiControl,1: +Background%New_BackGround_Color%,The_BackGround
	GuiControl,1:Move,Target1,w%Target_Width% h%Target_Height%
	Target.w:=Target_Width
	Target.h:=Target_Height
	return
Move_Target:
	Target.Timer++
	if(Target.Timer>30)
		{
			Random,Dir,1,4
			Target.Dir:=Dir
			Target.Timer:=0		
		}
	if(Target.x<20)
			Target.Dir:=2
	else if(Target.x>(680-Target.w))
			Target.Dir:=4
	else if(Target.y<40)
			Target.Dir:=3
	else if(Target.y>(370-Target.h))
			Target.Dir:=1			
	if(Target.Dir=1)
			Target.y-=Speed
	else if(Target.Dir=2)
			Target.x+=Speed
	else if(Target.Dir=3)
			Target.y+=Speed
	else if(Target.Dir=4)
			Target.x-=Speed
	GuiControl,1:Move,Target1,% "x" Target.x " y" Target.y
	return
Check_Hit()
	{
		if(Rad1=1)
			{
				mouseGetPos,,,,c1,2
				if(C1==THwnd)
					{
						Click_Count++
						GuiControl,1:,Click_Count,% "Count: " Click_Count
						Max_X:=680-Target.w
						Random,x,20,Max_X
						Target.x:=x
						Max_Y:=370-Target.h
						Random,y,40,Max_y
						Target.y:=y
						GuiControl,1:Move,Target1,% "x" Target.x " y" Target.y
					}
			}		
		else if(rad2=1)
			{
				mouseGetPos,,,,c1,2
				if(C1==THwnd)
					{
						Click_Count++
						GuiControl,1:,Click_Count,% "Count: " Click_Count
					}
			}		
	}
*^Numpad1::ExitApp
;
