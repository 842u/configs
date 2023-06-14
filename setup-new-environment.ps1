Import-Module "./Install-ChocolateyPackage.psm1"

# Install/Upgrade Scoop
Invoke-Expression -Command "./install-upgrade-scoop.ps1"

# Install/Upgrade Chocolatey
Invoke-Expression -Command "./install-upgrade-chocolatey.ps1"

# Install WSL
Invoke-Expression -Command "./install-wsl.ps1"

# Install/Upgrade PowerShell Core
Install-ChocolateyPackage -PackageName "powershell-core"

# Install/Upgrade NodeJS
Install-ChocolateyPackage -PackageName "nodejs"

# Install/Upgrade Python
Install-ChocolateyPackage -PackageName "python"

# Install/Upgrade MSYS2
Install-ChocolateyPackage -PackageName "msys2"

# Install/Upgrade MinGW64 toolchain
Invoke-Expression -Command "./install-upgrade-mingw64-toolchain.ps1"

# Install/Upgrade Git
Install-ChocolateyPackage -PackageName "git"
Invoke-Expression -Command "./setup-git.ps1"

# Install/Upgrade GitHub CLI
Install-ChocolateyPackage -PackageName "gh"
Invoke-Expression -Command "./setup-gh.ps1"

# Install/Upgrade Oh-My-Posh
Invoke-Expression -Command "./install-upgrade-oh-my-posh.ps1"
Invoke-Expression -Command "./setup-oh-my-posh.ps1"

# Install/Upgrade VS Code
Install-ChocolateyPackage -PackageName "vscode"

# Install/Upgrade VS Code Insiders
Install-ChocolateyPackage -PackageName "vscode-insiders"

# Install/Upgrage PowerToys
Install-ChocolateyPackage -PackageName "powertoys"

# Install/Upgrade Google Chrome
Install-ChocolateyPackage -PackageName "googlechrome"

# Install/Upgrade Firefox
Install-ChocolateyPackage -PackageName "firefox"

# Install/Upgrade LibreOffice
Install-ChocolateyPackage -PackageName "libreoffice-fresh"

# Install/Upgrade Blender
Install-ChocolateyPackage -PackageName "blender"

# Install/Upgrade GIMP
Install-ChocolateyPackage -PackageName "gimp"

# Install/Upgrade VLC
Install-ChocolateyPackage -PackageName "vlc"

# Install/Upgrade Komorebi
Invoke-Expression -Command "./install-upgrade-komorebi.ps1"

