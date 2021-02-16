using module .\Install-Programs.psm1

$ListOfProgramsToInstall = "sql-server-2019"
Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall -Restart $true

