$scoopPath = Get-Command scoop -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

if (-not $scoopPath) {
  Write-Host "Scoop is not installed..." -ForegroundColor DarkYellow

  $installChoice = Read-Host "Do you want to install Scoop? (y/n)"

  if ($installChoice -ieq 'y') {
    Write-Host "Installing Scoop..." -ForegroundColor DarkYellow

    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
  }
  else {
    Write-Host "Skipping Scoop installation..." -ForegroundColor DarkYellow
  }
}
else {
  Write-Host "Scoop is already installed..." -ForegroundColor DarkYellow

  $upgradeChoice = Read-Host "Do you want to upgrade Scoop? (y/n)"

  if ($upgradeChoice -ieq 'y') {
    Write-Host "Upgrading Scoop..." -ForegroundColor DarkYellow
    
    scoop update
  }
  else {
    Write-Host "Skipping Scoop upgrade..." -ForegroundColor DarkYellow
  }
}