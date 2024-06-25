using module .\Log-SimpleFile.psm1

$LOG_PATH = "C:\localsetuplog.txt"

$WINDOWS_REGISTRY_STARTUP_PATH = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$WINDOWS_REGISTRY_APP_COMPATIBILITY_PATH = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
$IDENTIFY_APP_NAME_PATTERN = "(?!.*\\)([^\.]*)"



Log-SimpleFile -Path $LOG_PATH -Message "Setting run as admin behavior for:"

$paths_to_be_run_as_admin = "C:\Program Files\Ditto\Ditto.exe"
$paths_to_be_run_as_admin = $paths_to_be_run_as_admin + ",C:\Program Files\AutoHotkey\AutoHotkeyU64.exe"
$paths_to_be_run_as_admin = $paths_to_be_run_as_admin + ",C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"
$paths_to_be_run_as_admin = $paths_to_be_run_as_admin + ",C:\Program Files (x86)\VirtuaWin\VirtuaWin.exe"

foreach($path in $paths_to_be_run_as_admin -split ',')
{
    $app_name = (Select-String -InputObject $path -Pattern $IDENTIFY_APP_NAME_PATTERN).Matches[0].Groups[0].Value
    
    New-ItemProperty `
        -Path $WINDOWS_REGISTRY_APP_COMPATIBILITY_PATH `
        -Name $path `
        -Value "RUNASADMIN" `
        -PropertyType "String"

    Log-SimpleFile -Path $LOG_PATH -Message $app_name

}



Log-SimpleFile -Path $LOG_PATH -Message "Adding to Windows Start up:"

$paths_to_run_on_startup = """C:\Program Files (x86)\VirtuaWin\VirtuaWin.exe"""
$paths_to_run_on_startup = $paths_to_run_on_startup + ",""C:\Program Files\Ditto\Ditto.exe"""
$paths_to_run_on_startup = $paths_to_run_on_startup + ",""C:\Program Files\AutoHotkey\AutoHotkeyU64.exe"" C:\Users\dgleason\Documents\source\repos\DevinLocalSetup\Map-WinV-to-Ditto.ahk"

foreach($path in $paths_to_run_on_startup -split ',')
{
    $app_name = (Select-String -InputObject $path -Pattern $IDENTIFY_APP_NAME_PATTERN).Matches[0].Groups[0].Value
    
    New-ItemProperty `
        -Path $WINDOWS_REGISTRY_STARTUP_PATH `
        -Name $app_name `
        -Value $path `
        -PropertyType "String"

    Log-SimpleFile -Path $LOG_PATH -Message $app_name

}