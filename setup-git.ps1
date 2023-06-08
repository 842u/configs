$setupGit = Read-Host "Would you like to setup git? (y/n)"

if ($setupGit -ieq 'y') {
  $userName = Read-Host "Enter your name for git"
  git config --global user.name $userName

  $userEmail = Read-Host "Enter your email for git"
  git config --global user.email $userEmail

  $ignoreCase = Read-Host "Should git ignore case? (y/n)"

  if ($ignoreCase -ieq 'y') {
    git config --global core.ignorecase true
  }
  else {
    git config --global core.ignorecase false
  }
}
else {
  Write-Host "Skipping git setup." -ForegroundColor DarkYellow
}
