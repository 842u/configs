$komorebiPath = Get-Command komorebi -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

if (-not $komorebiPath) {
  Write-Host "Komorebi is not installed..." -ForegroundColor DarkYellow

  $installChoice = Read-Host "Do you want to install Komorebi? (y/n)"

  if ($installChoice -ieq 'y') {
    Write-Host "Installing Komorebi..." -ForegroundColor DarkYellow

    scoop bucket add extras
    Invoke-Expression -Command "./install-upgrade-whkd.ps1"
    scoop install komorebi

    # Latest generated app-specific config tweaks and fixes
    Invoke-WebRequest https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebi.generated.ps1 -OutFile $Env:USERPROFILE\komorebi.generated.ps1

    # Sample komorebi configuration
    Invoke-WebRequest https://raw.githubusercontent.com/LGUG2Z/komorebi/master/komorebi.sample.ps1 -OutFile $Env:USERPROFILE\komorebi.ps1

    # Ensure that ~/.config folder exists
    New-Item -ItemType Directory -Path $Env:USERPROFILE\.config -ErrorAction SilentlyContinue | Out-Null

    # Sample whkdrc file with key bindings
    Invoke-WebRequest https://raw.githubusercontent.com/LGUG2Z/komorebi/master/whkdrc.sample -OutFile $Env:USERPROFILE\.config\whkdrc
  }
  else {
    Write-Host "Skipping Komorebi installation..." -ForegroundColor DarkYellow
  }
}
else {
  Write-Host "Komorebi is already installed..." -ForegroundColor DarkYellow

  $upgradeChoice = Read-Host "Do you want to upgrade Komorebi? (y/n)"

  if ($upgradeChoice -ieq 'y') {
    Write-Host "Upgrading Komorebi..." -ForegroundColor DarkYellow

    Invoke-Expression -Command "./install-upgrade-whkd.ps1"
    scoop update komorebi
  }
  else {
    Write-Host "Skipping Komorebi upgrade..." -ForegroundColor DarkYellow
  }
}