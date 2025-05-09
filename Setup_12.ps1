using module .\Log-SimpleFile.psm1

$LOG_PATH = "C:\localsetuplog.txt"

$SCRCPY_PATH =  "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\ScrCpy"


Write-output "Pin '$SCRCPY_PATH\scrpy.exe' to taskbar. Right Click, Properties, at the end of 'Target' append '--no-audio' "

Write-output "Press Enter key to exit."

Read-Host