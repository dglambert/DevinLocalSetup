using module .\Install-Programs.psm1

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart


$ListOfProgramsToInstall = "kdiff3,notepadplusplus,7zip,zoom,googlechrome,slack,gitextensions,dotpeek,autohotkey,virtuawin,ditto,paint.net,visualstudio2019enterprise,visualstudio2022professional,razer-synapse-3,vscode,microsoft-windows-terminal,python,nuget.commandline,svn,azure-cli,rdcman"
Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall -Restart $true
