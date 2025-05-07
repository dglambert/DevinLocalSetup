using module .\Log-SimpleFile.psm1

$LOG_PATH = "C:\localsetuplog.txt"


Log-SimpleFile -Path $LOG_PATH -Message "Copying repo '\VirtuaWin' to ''"

#Write-Host "Source: $PWD\Microsoft.PowerShell_profile.ps1" 
#Write-Host "Destination: $CurrentUserPowerShellProfilePath" 

Copy-Item -Path "$PWD\VirtuaWin" -Destination "$env:APPDATA" -Recurse -Force -Verbose
#robocopy "$PWD" "$CurrentUserPowerShellProfilePath" "Microsoft.PowerShell_profile.ps1"

# This is not working, leaving for now as a reminder to add ps1 to profile directory