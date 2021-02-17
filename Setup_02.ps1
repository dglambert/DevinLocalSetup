using module .\Install-Programs.psm1

$ListOfProgramsToInstall = "kdiff3,notepadplusplus,7zip,zoom,googlechrome,slack,gitextensions,autohotkey,virtuawin,ditto,paint.net,visualstudio2019enterprise"
Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall -Restart $true