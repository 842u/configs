$setupGit = Read-Host "Would you like to setup GitHub? (y/n)"
$setupGit = $setupGit.ToLower()

if ($setupGit -eq 'y') {
  gh auth login
  else {
    Write-Host "Skipping GitHub setup." -ForegroundColor DarkYellow
  }
}
