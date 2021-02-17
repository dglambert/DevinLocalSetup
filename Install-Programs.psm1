using module .\Log-SimpleFile.psm1

function Install-Programs {

Param(

    [string]$ListOfProgramsToInstall
    , 
    [bool]$Restart = $false
    ,
    [string]$LogPath = "C:\localsetuplog.txt"

)

    Set-ExecutionPolicy Bypass -Scope Process -Force; 

    $ProgramsToInstall = $ListOfProgramsToInstall -split ","

    foreach($ProgramToInstall in $ProgramsToInstall)
    {
        Log-SimpleFile -Path $LogPath -Message "Installing $ProgramToInstall" 
        #choco install $ProgramToInstall -y
    }

    $ExitMessage = "Press Enter key to Continue."

    if($Restart)
    {
        $ExitMessage = "Restarting Computer. " + $ExitMessage
    }

    Write-Output $ExitMessage
    
    Read-Host

    if($Restart)
    {    
        Write-Output "Restarting..."
        #Restart-Computer 
    }

}