using module .\Log-SimpleFile.psm1

$LOG_PATH = "C:\localsetuplog.txt"

$WINDOWS_REGISTRY_APP_COMPATIBILITY_PATH = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"
$IDENTIFY_APP_NAME_PATTERN = "(?!.*\\)([^\.]*)"
$PATH_TO_SCHEDULED_TASKS = 'C:\Users\dgleason\Documents\source\repos\DevinLocalSetup\Scheduled Tasks'


Log-SimpleFile -Path $LOG_PATH -Message "Setting run as admin behavior for:"

$paths_to_be_run_as_admin = "C:\Program Files (x86)\Razer\Synapse3\WPFUI\Framework\Razer Synapse 3 Host\Razer Synapse 3.exe"

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



Log-SimpleFile -Path $LOG_PATH -Message "Importing Scheduled Tasks:"

foreach($scheduled_task_xml in $PATH_TO_SCHEDULED_TASKS | Get-ChildItem )
{

    Register-ScheduledTask -TaskPath "\" `
                            -TaskName $scheduled_task_xml.BaseName `
                            -XML (Get-Content $scheduled_task_xml.FullName -raw)


    Log-SimpleFile -Path $LOG_PATH -Message $scheduled_task_xml.FullName

}