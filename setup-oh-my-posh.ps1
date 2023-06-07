# TODO Check if bash profile file exists

$setupOhMyPosh = Read-Host "Would you like to setup Oh My Posh? (y/n)"
$setupOhMyPosh = $setupOhMyPosh.ToLower()

if ($setupOhMyPosh -eq 'y') {
  $fontInstallChoice = Read-Host "Would you like to install the recommended fonts? (y/n)"
  $fontInstallChoice = $fontInstallChoice.ToLower()
  if ($fontInstallChoice -eq 'y') {
    Write-Host "Installing fonts..." -ForegroundColor DarkYellow
    oh-my-posh font install
  }
  else {
    Write-Host "Skipping font installation." -ForegroundColor DarkYellow
  }

  $setupBashChoice = Read-Host "Would you like to setup bash profile theme? (y/n)"
  $setupBashChoice = $setupBashChoice.ToLower()
  if ($setupOhMyPosh -eq 'y') {
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
}
else {
  Write-Host "Skipping Oh My Posh setup." -ForegroundColor DarkYellow
}