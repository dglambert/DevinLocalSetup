using module .\Log-SimpleFile.psm1


$LOG_PATH = "C:\localsetuplog.txt"

$powerNamespace = @{ Namespace = 'root\cimv2\power' }

# https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/power-button-and-lid-settings-lid-switch-close-action
enum LidAction {
    DoNothing = 0
    Sleep = 1
    Hibernate = 2
    ShutDown = 3
}

enum PowerSupply {
    AC # Plugged In
    DC # On Battery
}


function Set-LidBehavior {

Param(
    [LidAction] $LidAction
    ,
    [PowerSupply] $PowerSupply
)

    # get active plan
    $curPlan = Get-CimInstance @powerNamespace -Class Win32_PowerPlan -Filter "IsActive = TRUE"

    # get lid closed setting
    $lidSetting = Get-CimInstance @powerNamespace -ClassName Win32_Powersetting -Filter "ElementName = 'Lid close action'"

    # get guids
    $planGuid = [Regex]::Matches($curPlan.InstanceId, "{.*}" ).Value
    $lidGuid = [Regex]::Matches($lidSetting.InstanceID, "{.*}" ).Value

    # get plugged in lid setting    
    $pluggedInLidSetting = Get-CimInstance @powerNamespace -ClassName Win32_PowerSettingDataIndex `
        -Filter "InstanceID = 'Microsoft:PowerSettingDataIndex\\$planGuid\\$PowerSupply\\$lidGuid'"

    # set lid action to do nothing
    $pluggedInLidSetting | Set-CimInstance -Property @{ SettingIndexValue = [int]$LidAction }

    Log-SimpleFile -Path $LOG_PATH -Message "Setting lid close behavior to '$LidAction' when on '$PowerSupply'."

}
