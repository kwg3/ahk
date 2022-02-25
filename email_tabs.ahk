#SingleInstance force
global x

Gui, Color,Gray,

FormatTime, Time1,h , h tt
StringRight,time2,time1,2
myHour>=13?myHour-=12:myHour<1?myHour+=12

Gui, Add, Text,, SI:
Gui, Add, Edit, r1 vTICKET w300, Enter Ticket
Gui, Add, Text,, Paste Alarm/s here:
Gui, Add, Edit, r4 vAlarms w300, 
Gui, Add, Text,, Please place Device/s name here:
Gui, Add, Edit,  vDevicename w300, 
Gui, Add, Text,, list 
Gui, Add, ComboBox,vlist w300, add email|add email|add email
Gui, Add, Text,,  Group 1
Gui, Add, ComboBox, r9 vGroup_1 w300, add email|add email|add email
Gui, Add, Text,, Group 2
Gui, Add, ComboBox, r9 vGroup_2 w300, add email|add email|add email
Gui, Add, Text,, Group email 3
Gui, Add, ComboBox, r9 vGroup_3 w300, add email|add email|add email
Gui, Add, Text,, Group email 4
Gui, Add, ComboBox, r9 vGroup_4 w300, add email|add email|add email
Gui, Add, Text,, Email 5
;CC
Gui, Add, ComboBox, vEmailDistro, add email|add email|add email
Gui, Add, Text,, Email 6
Gui, Add, ComboBox, vEmailGroup, add email|add email|add email
Gui,Add,Button, w300 gEmail, Submit information
Gui, Show
return

Email:
{
	Gui, Submit
	Run, Outlook
		winhide
			winwaitactive,ahk_exe Outlook.exe
				olMailItem := 0
				MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
				MailItem.Display
				Sleep 500
				
				;Adding Distro:
				SendInput, %EmailDistro%{ENTER}{SPACE}
				Sleep 500
				SendInput, %Group_1% {ENTER}{SPACE}
				Sleep 500
				SendInput, %Group_2% {ENTER}{SPACE}
				Sleep 500
				SendInput, %Group_3% {ENTER}{SPACE}
				Sleep 500
				SendInput, %Group_4% {ENTER}{TAB}
				Sleep 1000 
				
				;Adding "CC":
				SendInput, {ENTER}{SPACE}
				SendInput, %EmailDistro%{ENTER}{TAB}{TAB}
				Sleep 1000 
				
				;Adding Subject:
				SendInput, %Ticket_Number%-%list%-%Devicename% {TAB}
				Sleep 1000 
				
				SendInput, Good day, {ENTER}{TAB}
				SendInput, Due to this email, Im writing to you for .....{ENTER}{TAB}
				SendInput, %Alarms% {Enter}
				Sleep 1000
				SendInput, ^a
				SendInput, ^e
				SendInput, ^l
				
	Return
	}
	
	
Edit_Notepad:
Run, notepad.exe
return


currentTime:
GuiControl,, display, %A_Hour%:%A_Min%:%A_Sec%
Return

Exit:
ExitApp
