

"$(Get-Date -Format "yyyy/MM/dd hh:mm tt") - Installing chocolatey" | Out-File -FilePath "C:\localsetuplog.txt" -Append 
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Write-Output "Restarting Computer. Hit Any Key to Continue."
Read-Host

Restart-Computer 

