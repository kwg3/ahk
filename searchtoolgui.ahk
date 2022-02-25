#SingleInstance force
;========================================================
Gui,Add, Text,, Search for:
Gui,Add, Edit ,w150 h50 vsend
Gui,Add,Button, w300 gSearch_DL, Search
Gui,Add, Text,, Search for ticket:
Gui,Add, Edit ,w300 h50 vTicket
Gui,Add,Button, w150 gSearch2, Search 
Gui show
return
;========================================================
Search_DL:
{
Gui, Submit, Nohide
Run,chrome.exe
winwaitactive,ahk_exe chrome.exe
SendInput, https://www.google.com/search?q=%send% {ENTER}
Sleep 500
return
}
Search_Ticket:
{
Gui, Submit, Nohide
Run,chrome.exe
winwaitactive,ahk_exe chrome.exe
SendInput, https://www.google.com/search?q=%send2% {ENTER}
Sleep 500
Return
}
