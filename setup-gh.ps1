$setupGit = Read-Host "Would you like to setup GitHub? (y/n)"

if ($setupGit -ieq 'y') {
  gh auth login
  else {
    Write-Host "Skipping GitHub setup." -ForegroundColor DarkYellow
  }
}
