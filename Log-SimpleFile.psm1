function Log-SimpleFile {

Param(
    [string] $Path
    ,
    [string] $Message
    ,
    [bool]$EchoToScreen = $true
)

    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force; 

    $log = "$(Get-Date -Format "yyyy/MM/dd hh:mm tt") - $Message"
    if($EchoToScreen)
    {
        Write-Output $log
    }
    $log | Out-File -FilePath $Path -Append
}