# Check if Chocolatey is installed
$chocoPath = Get-Command choco.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source

if (-not $chocoPath) {
  Write-Host "Chocolatey is not installed..." -ForegroundColor DarkYellow
  $installChoice = Read-Host "Do you want to install Chocolatey? (y/n)"

  if ($installChoice -eq 'y' -or $installChoice -eq 'Y') {
    Write-Host "Installing Chocolatey..." -ForegroundColor DarkYellow
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
  }
  else {
    Write-Host "Skipping Chocolatey installation..." -ForegroundColor DarkYellow
    exit
  }

}
else {
  Write-Host "Chocolatey is already installed..." -ForegroundColor DarkYellow
  $upgradeChoice = Read-Host "Do you want to upgrade Chocolatey? (y/n)"
  if ($upgradeChoice -eq 'y' -or $upgradeChoice -eq 'Y') {
    Write-Host "Upgrading Chocolatey..." -ForegroundColor DarkYellow
    choco upgrade chocolatey
  }
  else {
    Write-Host "Skipping Chocolatey upgrade..." -ForegroundColor DarkYellow
  }
}
