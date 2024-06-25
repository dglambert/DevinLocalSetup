using module .\Install-Programs.psm1

$ListOfProgramsToInstall = "sql-server-management-studio"
Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall 

Write-output "Press Enter key to exit."

Read-Host
