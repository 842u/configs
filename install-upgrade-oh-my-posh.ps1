$ohMyPoshPath = Get-Command oh-my-posh.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

if (-not $ohMyPoshPath) {
  Write-Host "Oh-My-Posh is not installed..." -ForegroundColor DarkYellow

  $installChoice = Read-Host "Do you want to install Oh-My-Posh? (y/n)"

  if ($installChoice -ieq 'y') {
    Write-Host "Installing Oh-My-Posh..." -ForegroundColor DarkYellow

    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
  }
  else {
    Write-Host "Skipping Oh-My-Posh installation..." -ForegroundColor DarkYellow
  }

}
else {
  Write-Host "Oh-My-Posh is already installed..." -ForegroundColor DarkYellow

  $upgradeChoice = Read-Host "Do you want to upgrade Oh-My-Posh? (y/n)"

  if ($upgradeChoice -ieq 'y') {
    Write-Host "Upgrading Oh-My-Posh..." -ForegroundColor DarkYellow
    
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
  }
  else {
    Write-Host "Skipping Oh-My-Posh upgrade..." -ForegroundColor DarkYellow
  }
}

# Refresh the PATH environment variable
[System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, [System.EnvironmentVariableTarget]::Process)
