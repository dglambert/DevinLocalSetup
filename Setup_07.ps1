using module .\Log-SimpleFile.psm1

$LogPath = "C:\localsetuplog.txt"

$KeyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

Log-SimpleFile -Path $LogPath -Message "Disabling - System > Multitasking > When I snap a window, show what I can snap next to it."
Set-ItemProperty -Path $KeyPath -Name "SnapAssist" -Value 0

Log-SimpleFile -Path $LogPath -Message "Disabling - System > Multitasking > When I snap a window, automatically size to fill available space."
Set-ItemProperty -Path $KeyPath -Name "SnapFill" -Value 0

Log-SimpleFile -Path $LogPath -Message "Disabling - System > Multitasking > When I snap a window, simultaneously resize any adjacent snapped window."
Set-ItemProperty -Path $KeyPath -Name "JointResize" -Value 0


$keyPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad"
Log-SimpleFile -Path $LogPath -Message "Disabling - Settings > Devices > Touchpad > Press the lower right corner of the touchpad to right-click"
Set-ItemProperty -Path $keyPath -Name "RightClickZoneEnabled" -Value 0


Write-Output "Restarting Computer. Hit Enter Key to Continue."
Read-Host

Restart-Computer 
