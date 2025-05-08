using module .\Log-SimpleFile.psm1
using module .\RunAsAdmin.psm1

$LOG_PATH = "C:\localsetuplog.txt"

$WINDOWS_REGISTRY_APP_COMPATIBILITY_PATH = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
$IDENTIFY_APP_NAME_PATTERN = "(?!.*\\)([^\.]*)"



$paths_to_be_run_as_admin = 
                            @(
                                "C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"
                                , "C:\Program Files\Ditto\Ditto.exe"
                                , "C:\Program Files (x86)\VirtuaWin\VirtuaWin.exe"
                                , "C:\Program Files\AutoHotkey\AutoHotkeyU64.exe"
                                , "C:\Program Files\Git\git-bash.exe"
                            )

foreach($path in $paths_to_be_run_as_admin)
{
    Set-ProgramRunAsAdmin -ProgramPath $path
    Log-SimpleFile -Path $LOG_PATH -Message "Set run as admin behavior for: '$($path)'"
}

