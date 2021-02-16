function Install-Programs {

Param(

    [string]$ListOfProgramsToInstall
    , 
    [bool]$Restart = $false

)

    Set-ExecutionPolicy Bypass -Scope Process -Force; 

    $ProgramsToInstall = $ListOfProgramsToInstall -split ","

    foreach($ProgramToInstall in $ProgramsToInstall)
    {
        $log = "$(Get-Date -Format "yyyy/MM/dd hh:mm tt") - Installing $ProgramToInstall"
        Write-Output $log
        $log | Out-File -FilePath "C:\localsetuplog.txt" -Append 
        choco install $ProgramToInstall -y
    }

    $ExitMessage = "Hit Any Key to Continue."

    if($Restart)
    {
        $ExitMessage = "Restarting Computer. " + $ExitMessage
    }

    Write-Output $ExitMessage
    
    Read-Host

    if($Restart)
    {    
        Write-Output "Restarting..."
        Restart-Computer 
    }

}