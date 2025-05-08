using module .\Log-SimpleFile.psm1
using module .\AddToStartup.psm1

$LOG_PATH = "C:\localsetuplog.txt"


$paths_to_add_to_startup = @(
    
    @{
        Path = "C:\Program Files\AutoHotkey\AutoHotkeyU64.exe"
        Argument = "$($HOME)\Desktop\Map-WinV-to-Ditto.ahk"
    }
    
    
    # , @{
    #     Path = "C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"
    #     Argument = "/StartMinimized"
    # }

    # , @{
    #     Path = "C:\Program Files\Ditto\Ditto.exe"
    # }

    # , @{
    #     Path = "C:\Program Files (x86)\VirtuaWin\VirtuaWin.exe"
    # }

)

foreach($startupApp in $paths_to_add_to_startup)
{
    Add-CurrentUserStartupAppToRegistry -ApplicationPath $startupApp.Path -Argument $startupApp.Argument
    
    Log-SimpleFile -Path $LOG_PATH -Message "Added '$($startupApp.Path)' to startup"

}



