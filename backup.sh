#!/usr/bin/env bash

cp /app/* /app_run/repository

cd /app_run/repository

git add .
git commit -m "Tergum - Automatic backup"
git push -u origin master --force
