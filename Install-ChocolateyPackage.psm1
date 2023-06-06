function Install-ChocolateyPackage {
  param(
    [Parameter(Mandatory = $true)]
    [string]$PackageName
  )

  $chocoOutput = choco list $PackageName

  if ($chocoOutput -match $PackageName) {
    Write-Host "Package $PackageName is installed..." -ForegroundColor DarkYellow

    $upgradeChoice = Read-Host "Do you want to upgrade $PackageName? (y/n)"
    $upgradeChoice = $upgradeChoice.ToLower()

    if ($upgradeChoice -eq 'y') {
      Write-Host "Upgrading $PackageName..." -ForegroundColor DarkYellow
      choco upgrade $PackageName
    }
    else {
      Write-Host "Skipping $PackageName upgrade." -ForegroundColor DarkYellow
    }
  }
  else {
    Write-Host "Package $PackageName is not installed..." -ForegroundColor DarkYellow

    $installChoice = Read-Host "Do you want to install $PackageName? (y/n)"
    $installChoice = $installChoice.ToLower()

    if ($installChoice -eq 'y') {
      Write-Host "Installing $PackageName..." -ForegroundColor DarkYellow
      choco install $PackageName
    }
    else {
      Write-Host "Skipping $PackageName installation." -ForegroundColor DarkYellow
    }
  }
}