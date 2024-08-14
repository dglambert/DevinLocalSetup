using module .\Install-Programs.psm1

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

$ListOfProgramsToInstall_IDEsAndCompilers = @(
        "visualstudio2019enterprise"
        , "visualstudio2022professional"
        , "vscode"
        , "python"
        , "visualstudio2022-workload-nativedesktop"
    )

$ListOfProgramsToInstall_DevelopmentTools = @(
        "gitextensions"
        , "dotpeek"
        , "microsoft-windows-terminal"
        , "nuget.commandline"
        , "svn"
        , "azure-cli"
    )

$ListOfProgramsToInstall_CommonApplications = @(
        "zoom"
        , "googlechrome"
        , "slack"
        , "autohotkey"
        , "virtuawin"
        , "ditto"
        , "paint.net"
        , "razer-synapse-3"
    )

$ListOfProgramsToInstall_Utilities = @(
        "notepadplusplus"
        , "kdiff3"
        , "7zip"
        , "rdcman"
    )


$ListOfProgramsToInstall = $($ListOfProgramsToInstall_IDEsAndCompilers ; $ListOfProgramsToInstall_DevelopmentTools ; $ListOfProgramsToInstall_CommonApplications ; $ListOfProgramsToInstall_Utilities) -join ","

Install-Programs -ListOfProgramsToInstall $ListOfProgramsToInstall -Restart $true
