param(
    [Parameter(Mandatory=$true)][string]$theme
)

function Wait-For-SettingsWindows-Then-Kill # Modified from https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/waiting-for-process-launch
{
    param
    (
        [Switch]
        $IgnoreAlreadyRunningProcesses
    )

    if ($IgnoreAlreadyRunningProcesses)
    {
        $NumberOfProcesses = (Get-Process | Where-Object {$_.Name -eq "SystemSettings"} -ErrorAction SilentlyContinue).Count
    }
    else
    {
        $NumberOfProcesses = 0
    }


    while ( (Get-Process | Where-Object {$_.Name -eq "SystemSettings"} -ErrorAction SilentlyContinue).Count -eq $NumberOfProcesses )
    {
        Start-Sleep -Milliseconds 400
    }

    $window = Get-Process | Where-Object {$_.Name -eq "SystemSettings"}
    Stop-Process -Id $window.Id
}


$Windows10Theme = "$env:LOCALAPPDATA\Microsoft\Windows\Themes\$theme.theme"
Invoke-Expression $Windows10Theme -ErrorAction Stop # Change theme by running .theme file directly, stops if file does not exist

# Close the settings window that is opened by the action above
Wait-For-SettingsWindows-Then-Kill
