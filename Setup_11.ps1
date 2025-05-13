using module .\Log-SimpleFile.psm1
using module .\AddToStartup.psm1

$LOG_PATH = "C:\localsetuplog.txt"


foreach($scheduled_task_xml in "$PWD\Scheduled Tasks" | Get-ChildItem )
{
    Register-ScheduledTask -TaskPath "\" `
                            -TaskName $scheduled_task_xml.BaseName `
                            -XML (Get-Content $scheduled_task_xml.FullName -raw)

    Log-SimpleFile -Path $LOG_PATH -Message "Importing Scheduled Tasks: $($scheduled_task_xml.FullName)"
}


Write-output "Press Enter key to exit."

Read-Host
