$installChoice = Read-Host "`nWould you like to install Windows Subsystem for Linux? (y/n)"

if ($installChoice -ieq 'y') {
  Write-Host "Installing Windows Subsystem for Linux..." -ForegroundColor DarkYellow

  wsl --list --online

  $distroChoice = Read-Host "`nWhich distro would you like to install?"
  $distroChoice = $distroChoice.ToLower()

  wsl --install $distroChoice
}
else {
  Write-Host "Skipping Windows Subsystem for Linux installation..." -ForegroundColor DarkYellow
}
