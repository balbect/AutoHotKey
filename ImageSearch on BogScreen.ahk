#SingleInstance, force
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
;== Find the image===
;ImageSearch, OutputVarX, OutputVarY, X1, Y1, X2, Y2, ImageFile

#Numpad1::
ImageSearch, Location_X, Location_Y, 0, 0, A_ScreenWidth,A_ScreenHeight, B_B.png
	if(ErrorLevel=2)
		{
			msgbox,ErrorLevel = 2`nSomething is wrong when searching for B_B. Don't know what.
		}
	else if(ErrorLevel=1)
		{
			TrayTip,,Image B_B Not found. Now searching for No_Yes.,3 ;this line can be antything. we can make it run something else eventually. Why not make it run a new ImageSearch? Lets do so bellow.
			
			ImageSearch, Location_X, Location_Y, 0, 0, A_ScreenWidth,A_ScreenHeight, No_Yes.png
				if(ErrorLevel=2)
					{
						msgbox,ErrorLevel = 2`nSomething is wrong when searching for No_Yes.png. Don't know what.
					}
				
				else if (ErrorLevel=1)
					{
						TrayTip,,Image B_B Not found. Now searching for No_No.,3 
						
						ImageSearch, Location_X, Location_Y, 0, 0, A_ScreenWidth,A_ScreenHeight, No_No.png
							if (ErrorLevel=2)
								{
									msgbox,ErrorLevel = 2`n Something is wrong when searching for No_No. Don't know what.
								}
							else if (ErrorLevel=1)
								{
									ImageSearch, Location_X, Location_Y, 0, 0, A_ScreenWidth,A_ScreenHeight, Yes_No.png
										if(ErrorLevel=2)	
											{
												msgbox,ErrorLevel = 2`nSomething is wrong when searching for Yes_No.Don't know what.
											}
										else if(ErrorLevel=1)
											{
												ImageSearch, Location_X, Location_Y, 0, 0, A_ScreenWidth,A_ScreenHeight, Yes_Yes.png
													if(ErrorLevel=2)
														{
															msgbox,ErrorLevel = 2`nSomething is wrong when searching for Yes_Yes.png.Don't know what.
														}
													else if(ErrorLevel=1)
														{
															TrayTip,,None of the Images Found,3
														}
													else if(ErrorLevel=0)
														{
															TrayTip,,*****`nFound Yes_Yes`n*****
															Click, 208, 786
														}
											}
										else if(ErrorLevel=0)
											{
												TrayTip,,*****`nFound Yes_No`n*****
												Click, 208, 786
											}
								}
					}		else if(ErrorLevel=0)
								{
								TrayTip,,*****`nFound No_No`n***** 
								Click, 208, 786
								}
				
				else if(ErrorLevel=0)
					{
					TrayTip,,*****`nFound No_Yes`n***** 
					Click, 208, 786
					}
			
		}
	else if(ErrorLevel=0)
		{
			TrayTip,,*****`nFound test`n***** 
			Click, 208, 786
		}
Return


;https://www.autohotkey.com/boards/viewtopic.php?f=76&t=7053&p=42425&hilit=runing+image+search#p42425