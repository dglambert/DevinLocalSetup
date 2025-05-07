function Add-CurrentUserStartupAppToRegistry
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$ApplicationPath,

        [Parameter(Mandatory=$false)]
        [string]$Arguments = ""
    )

    try
    {
        if (-not (Test-Path -Path $ApplicationPath -PathType Leaf))
        {
            Write-Error "Application executable not found at path: $ApplicationPath"
            return
        }

        $EntryName = [System.IO.Path]::GetFileNameWithoutExtension($ApplicationPath)

        if ([string]::IsNullOrWhiteSpace($EntryName))
        {
            Write-Error "Could not derive a valid entry name from the application path: $ApplicationPath"
            return
        }

        $REGISTRY_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

        $RegistryValue = $ApplicationPath
        if ($ApplicationPath.Contains(" ") -and !$ApplicationPath.StartsWith('"'))
        {
            $RegistryValue = "`"$ApplicationPath`""
        }

        if (-not [string]::IsNullOrWhiteSpace($Arguments))
        {
            $RegistryValue += " $Arguments"
        }

        if (-not (Test-Path -Path $REGISTRY_PATH))
        {
            Write-Warning "Registry path not found: $REGISTRY_PATH."
        }

        Set-ItemProperty -Path $REGISTRY_PATH -Name $EntryName -Value $RegistryValue -Type String -Force -ErrorAction Stop

        Write-Host "Successfully added '$EntryName' to current user startup: $RegistryValue (Path: $REGISTRY_PATH)"
        Write-Verbose "Application '$ApplicationPath' will attempt to run the next time the current user logs in."
    }
    catch
    {
        Write-Error "Error adding '$ApplicationPath' to startup: $($_.Exception.Message)"
    }
}
