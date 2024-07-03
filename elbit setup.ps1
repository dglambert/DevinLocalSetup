using module .\Set-Close-Lid-Power-Settings.psm1

# setting up two chrome profiles, one for KMC and another for elbit america


# disable "Press the lower right corner of the touchpad to right-click"


Set-LidBehavior -PowerSupply AC -LidAction Sleep
Set-LidBehavior -PowerSupply DC -LidAction Sleep


Write-Output "Restarting Computer. Hit Enter Key to Continue."
Read-Host

Restart-Computer 