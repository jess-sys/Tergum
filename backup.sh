#!/usr/bin/env sh

echo "Pulling new changes"
cd /app_run/repository
git pull

cp /app/* /app_run/repository

echo "Backing up..."

git add .
git commit -m "Tergum - Automatic backup"
git push -u origin master --force
