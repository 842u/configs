Import-Module "./Install-ChocolateyPackage.psm1"

# Install/Upgrade Chocolatey
Invoke-Expression -Command "./install-upgrade-chocolatey.ps1"

# Install/Upgrade NodeJS
Install-ChocolateyPackage -PackageName "nodejs"

# Install/Upgrade Python
Install-ChocolateyPackage -PackageName "python"

# Install/Upgrade Git
Install-ChocolateyPackage -PackageName "git"
Invoke-Expression -Command "./setup-git.ps1"

# Install/Upgrade GitHub CLI
Install-ChocolateyPackage -PackageName "gh"
Invoke-Expression -Command "./setup-gh.ps1"

# Install/Upgrade Oh-My-Posh
Invoke-Expression -Command "./install-upgrade-oh-my-posh.ps1"