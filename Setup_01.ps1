using module .\Log-SimpleFile.psm1

$LogPath = "C:\localsetuplog.txt"

Log-SimpleFile -Path $LogPath -Message "Installing chocolatey"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Output "Restarting Computer. Hit Enter Key to Continue."
Read-Host

Restart-Computer 

