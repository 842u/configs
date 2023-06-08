$whkdPath = Get-Command whkd -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

if (-not $whkdPath) {
  Write-Host "WHKD is not installed..." -ForegroundColor DarkYellow

  $installChoice = Read-Host "Do you want to install WHKD? (y/n)"

  if ($installChoice -ieq 'y') {
    Write-Host "Installing WHKD..." -ForegroundColor DarkYellow

    scoop bucket add extras
    scoop install whkd
  }
  else {
    Write-Host "Skipping WHKD installation..." -ForegroundColor DarkYellow
  }
}
else {
  Write-Host "WHKD is already installed..." -ForegroundColor DarkYellow

  $upgradeChoice = Read-Host "Do you want to upgrade WHKD? (y/n)"

  if ($upgradeChoice -ieq 'y') {
    Write-Host "Upgrading WHKD..." -ForegroundColor DarkYellow

    scoop update whkd
  }
  else {
    Write-Host "Skipping WHKD upgrade..." -ForegroundColor DarkYellow
  }
}