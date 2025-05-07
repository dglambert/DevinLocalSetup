using module .\Log-SimpleFile.psm1

$LOG_PATH = "C:\localsetuplog.txt"


Copy-Item -Path "$PWD\VirtuaWin" -Destination "$env:APPDATA" -Recurse -Force -Verbose
Log-SimpleFile -Path $LOG_PATH -Message "Copied repo '\VirtuaWin' to '$env:APPDATA'"

Copy-Item -Path "$PWD\Map-WinV-to-Ditto.ahk" -Destination "$($HOME)\Desktop" -Force -Verbose
Log-SimpleFile -Path $LOG_PATH -Message "Copied repo '\Map-WinV-to-Ditto.ahk' to '$($HOME)\Desktop'"


#Write-Host "Source: $PWD\Microsoft.PowerShell_profile.ps1" 
#Write-Host "Destination: $CurrentUserPowerShellProfilePath" 



#robocopy "$PWD" "$CurrentUserPowerShellProfilePath" "Microsoft.PowerShell_profile.ps1"

# This is not working, leaving for now as a reminder to add ps1 to profile directory

$HOME