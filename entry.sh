#!/usr/bin/env sh

echo "Starting backup"

/app_run/backup.sh

/usr/sbin/cron -f -l 8
