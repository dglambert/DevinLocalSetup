using module .\Install-Programs.psm1

$ListOfProgramsToInstall = "sql-server-management-studio"
Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall 


Write-output "Manually install razer synapse 3 - https://www.razer.com/synapse-3"
Write-output "Press any key to exit."

Read-Host
