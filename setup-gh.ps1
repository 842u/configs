$setupGit = Read-Host "Would you like to setup GitHub? (y/n)"
$setupGit = $setupGit.ToLower()

if ($setupGit -eq 'y') {
  gh auth login
  else {
    write-host "Skipping GitHub setup." -ForegroundColor DarkYellow
  }
}
