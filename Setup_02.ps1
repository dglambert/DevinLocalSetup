using module .\Install-Programs.psm1

$ListOfProgramsToInstall = "kdiff3,notepadplusplus,7zip,zoom,googlechrome,slack,gitextensions,dotpeek,autohotkey,virtuawin,ditto,paint.net,visualstudio2019enterprise,razer-synapse-3"
Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall -Restart $true