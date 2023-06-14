$installChoice = Read-Host "Do you want to install MinGW64? (y/n)"

if ($installChoice -ieq 'y') {
  Write-Host "Installing MinGW64..." -ForegroundColor DarkYellow

  msys2 pacman -S --needed base-devel mingw-w64-x86_64-toolchain

  $addToPathChoice = Read-Host "Do you want to add MinGW64 to PATH? (y/n)"
  if ($addToPathChoice -ieq 'y') {

    $directoryToAdd = "C:\tools\msys64\mingw64\bin"
    
    if ([Environment]::GetEnvironmentVariable("PATH", "User").Split(";") -contains $directoryToAdd) {
      Write-Host "Directory is already in the PATH variable."
    }
    else {
      $currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
      $newPath = $currentPath + ";" + $directoryToAdd
      [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
      Write-Host "Directory added to the PATH variable."
    }
  }
  else {
    Write-Host "Skipping adding MinGW64 to PATH..." -ForegroundColor DarkYellow
  }
}
else {
  Write-Host "Skipping MinGW64 installation..." -ForegroundColor DarkYellow
}