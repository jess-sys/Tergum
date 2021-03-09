FROM ubuntu:latest

ENV GIT_REPOSITORY_URL=unknown
ENV GIT_USERNAME=Tergum
ENV GIT_EMAIL=bot@terg.um

ENV GIT_SSH_COMMAND='ssh -i /config/id_rsa -o IdentitiesOnly=yes -o StrictHostKeyChecking=no'

RUN apt update -y && apt -y install -qq --force-yes git cron
RUN mkdir -p /app && mkdir -p /app_run

COPY entry.sh /app_run/entry.sh
COPY backup.sh /app_run/backup.sh
COPY backup-repository-cron /app_run/backup-repository-cron

RUN git config --global user.name ${GIT_USERNAME}
RUN git config --global user.email ${GIT_EMAIL}

RUN chmod +x /app_run/entry.sh
RUN chmod +x /app_run/backup.sh
RUN chmod 0644 /app_run/backup-repository-cron

RUN crontab /app_run/backup-repository-cron

WORKDIR /app_run

CMD ["/app_run/entry.sh"]
