#!/usr/bin/env sh

echo "Copying private key..."
chmod 0400 /config/id_rsa

echo "Cloning the repository..."
rm -rf /app_run/repository
git clone $(cat /config/GIT_REPOSITORY_URL)  /app_run/repository

/app_run/backup.sh

/usr/sbin/cron -f -l 8
