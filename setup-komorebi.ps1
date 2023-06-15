$setupKomorebi = Read-Host "Would you like to setup Komorebi? (y/n)"

if ($setupKomorebi -ieq 'y') {

  $startWithWindows = Read-Host "Would you like Komorebi to start on Windows startup? (y/n)"
  if ($startWithWindows -ieq 'y') {
    $startupScriptsFolderPath = Join-Path -Path $env:USERPROFILE -ChildPath "\StartupScripts"

    if (Test-Path -Path $startupScriptsFolderPath) {
      Write-Host "Startup scripts folder already exists." -ForegroundColor DarkYellow
    }
    else {
      New-Item -Path $startupScriptsFolderPath -ItemType Directory
    }

    $startupScriptPath = Join-Path -Path $startupScriptsFolderPath -ChildPath "komorebi.ps1"

    $scriptCommand = "komorebic start --await-configuration"

    if (Test-Path -Path $startupScriptPath) {
      Write-Host "Startup script already exists." -ForegroundColor DarkYellow

      $scriptContent = Get-Content -Path $startupScriptPath

      if ($scriptContent -contains $scriptCommand) {
        Write-Host "Startup script already contains that command." -ForegroundColor DarkYellow
      }
      else {
        Add-Content -Path $startupScriptPath -Value $scriptCommand
      }
    }
    else {
      New-Item -Path $startupScriptPath -ItemType File
      Add-Content -Path $startupScriptPath -Value $scriptCommand
    }

    $action = New-ScheduledTaskAction -Execute "${Env:WinDir}\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument "-WindowStyle Hidden -Command `"& '$startupScriptPath'`""
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $settings = New-ScheduledTaskSettingsSet

    $task = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings

    Register-ScheduledTask -TaskName "Komorebi" -InputObject $task
  }
  else {
    Write-Host "Skipping Komorebi setup." -ForegroundColor DarkYellow
  }
}
else {
  Write-Host "Skipping Komorebi setup." -ForegroundColor DarkYellow
}