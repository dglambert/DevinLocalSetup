using module "C:\Users\dlambert\Desktop\Devin PC Setup\PinToTaskbar.psm1"



$PathTo_TaskBarShortCuts = "C:\Users\dlambert\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar";
                            
[PinToTaskBar_Verb] $pin = [PinToTaskBar_Verb]::new();

$pin.Pin("C:\Windows\explorer.exe") 
$pin.Pin("$env:windir\system32\SnippingTool.exe") 
$pin.Pin("C:\Windows\explorer.exe") 

$pin.Pin("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe") 
Set-RunAsAdmin -shortcutPath "$($PathTo_TaskBarShortCuts)\Google Chrome.lnk"

$pin.Pin("C:\Program Files\Notepad++\notepad++.exe") 
Set-RunAsAdmin -shortcutPath "$($PathTo_TaskBarShortCuts)\notepad++.lnk"

$pin.Pin("$env:windir\system32\WindowsPowerShell\v1.0\PowerShell_ISE.exe") 
Set-RunAsAdmin -shortcutPath "$($PathTo_TaskBarShortCuts)\Windows PowerShell ISE.lnk"

$pin.Pin("C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe") 
Set-RunAsAdmin -shortcutPath "$($PathTo_TaskBarShortCuts)\Microsoft Visual Studio 2019.lnk"

$pin.Pin("C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\Ssms.exe") 
Set-RunAsAdmin -shortcutPath "$($PathTo_TaskBarShortCuts)\SSMS 18.lnk"


$pin.Pin("$env:windir\system32\inetsrv\InetMgr.exe") 
Set-RunAsAdmin -shortcutPath "$($PathTo_TaskBarShortCuts)\IIS Manager.lnk"


