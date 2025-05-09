using module .\Log-SimpleFile.psm1

$LOG_PATH = "C:\localsetuplog.txt"

$CurrentUserPowerShellProfilePath = "$($env:USERPROFILE)\Documents\WindowsPowerShell"

Log-SimpleFile -Path $LOG_PATH -Message "Copying 'Microsoft.PowerShell_profile.ps1' to '$CurrentUserPowerShellProfilePath'"

#Write-Host "Source: $PWD\Microsoft.PowerShell_profile.ps1" 
#Write-Host "Destination: $CurrentUserPowerShellProfilePath" 

Copy-Item -Path "$PWD\Microsoft.PowerShell_profile.ps1" -Destination "$CurrentUserPowerShellProfilePath" -Verbose
#robocopy "$PWD" "$CurrentUserPowerShellProfilePath" "Microsoft.PowerShell_profile.ps1"

# This is not working, leaving for now as a reminder to add ps1 to profile directory

Write-output "Press Enter key to exit."

Read-Host