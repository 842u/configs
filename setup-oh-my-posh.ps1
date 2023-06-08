$setupOhMyPosh = Read-Host "Would you like to setup Oh My Posh? (y/n)"

if ($setupOhMyPosh -ieq 'y') {
  $fontInstallChoice = Read-Host "Would you like to install the recommended fonts? (y/n)"
  if ($fontInstallChoice -ieq 'y') {
    Write-Host "Installing fonts..." -ForegroundColor DarkYellow
    oh-my-posh font install
  }
  else {
    Write-Host "Skipping font installation." -ForegroundColor DarkYellow
  }

  $setupBashChoice = Read-Host "Would you like to setup bash profile theme? (y/n)"
  if ($setupBashChoice -ieq 'y') {
    Write-Host "Setting up bash profile theme..." -ForegroundColor DarkYellow
    $currentUserDir = $env:USERPROFILE
    $bashProfilePath = Join-Path -Path $currentUserDir -ChildPath ".bash_profile"

    if (Test-Path -Path $bashProfilePath) {
      Remove-Item -Path $bashProfilePath
    }
    else {
      New-Item -Path $bashProfilePath -ItemType File
    }

    $remoteTheme = "'https://raw.githubusercontent.com/842u/configs/main/.mytheme.omp.json'"
    
    $bashProfileContent = "eval `"`$(oh-my-posh init bash --config $remoteTheme)`"` "

    Set-Content -Path $bashProfilePath -Value $bashProfileContent
  }
  else {
    Write-Host "Skipping bash profile setup." -ForegroundColor DarkYellow
  }

  $setupPowerShellChoice = Read-Host "Would you like to setup PowerShell theme? (y/n)"
  if ($setupPowerShellChoice -ieq 'y') {
    Write-Host "Setting up PowerShell theme..." -ForegroundColor DarkYellow

    $powerShellProfilePath = "$PSHOME\Profile.ps1"
    if (Test-Path -Path $powerShellProfilePath) {
      Remove-Item -Path $powerShellProfilePath
    }
    else {
      New-Item -Path $powerShellProfilePath -ItemType File
    }

    Set-Content -Path $powerShellProfilePath -Value "oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/842u/configs/main/.mytheme.omp.json'| Invoke-Expression"
  }
  else {
    Write-Host "Skipping PowerShell setup." -ForegroundColor DarkYellow
  }
}
else {
  Write-Host "Skipping Oh My Posh setup." -ForegroundColor DarkYellow
}