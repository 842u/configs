# Import
Import-Module "./Install-ChocolateyPackage.psm1"

# Install/Upgrade Chocolatey
Invoke-Expression -Command "./install-upgrade-chocolatey.ps1"

Install-ChocolateyPackage -PackageName "nodejs"

Install-ChocolateyPackage -PackageName "python"

Install-ChocolateyPackage -PackageName "git"
Invoke-Expression -Command "./setup-git.ps1"
