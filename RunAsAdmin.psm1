function Set-ProgramRunAsAdmin
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [string]$ProgramPath
    )

    try
    {
        if (-not (Test-Path -Path $ProgramPath -PathType Leaf))
        {
            Write-Error "Program executable not found at path: $ProgramPath"
            return
        }

        $REGISTRY_KEY_PATH = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"

        if (-not (Test-Path -Path $REGISTRY_KEY_PATH))
        {
            New-Item -Path $REGISTRY_KEY_PATH -Force -ErrorAction Stop | Out-Null
            Write-Verbose "Created registry key: $REGISTRY_KEY_PATH"
        }

        $CurrentFlags = (Get-ItemProperty -Path $REGISTRY_KEY_PATH -Name $ProgramPath -ErrorAction SilentlyContinue).$ProgramPath
        $AdminFlag = "RUNASADMIN"
        $DesiredFlags = ""

        if ($CurrentFlags -like "*$AdminFlag*")
        {
            Write-Host "Program '$ProgramPath' is already set to run as administrator for the current user."
            return
        }
        else
        {
            if ([string]::IsNullOrWhiteSpace($CurrentFlags))
            {
                $DesiredFlags = $AdminFlag
            }
            else
            {
                $DesiredFlags = ($CurrentFlags.Split(' ') + $AdminFlag | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -Unique) -join ' '
            }
            
            Set-ItemProperty -Path $REGISTRY_KEY_PATH -Name $ProgramPath -Value $DesiredFlags -Type String -Force -ErrorAction Stop
            Write-Host "Successfully set '$ProgramPath' to run as administrator for the current user."
            Write-Verbose "New flags: $DesiredFlags"
        }
    }
    catch
    {
        Write-Error "An error occurred: $($_.Exception.Message)"
    }
}
