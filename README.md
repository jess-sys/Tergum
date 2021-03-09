# Tergum
Tergum - An elegant way to backup dot files using git and Docker

## How it works ?

* Mount the folders you want to backup to the `/app` folder inside the container.
* Specify the URL to the repository you want to publish using the `GIT_REPOSITORY_URL` variable
* Place your private key to be used to push to the repository under the `id_rsa` file
* You can also set the `GIT_USERNAME` and the `GIT_EMAIL` variables to be used in commits
* Edit the backup-repository-cron file if you want to backup more or less often than 6 hours.

## Credits
* Jessy SOBREIRO (jessy.sobreiro@epitech.eu)
