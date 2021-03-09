FROM ubuntu:latest

ENV GIT_REPOSITORY_URL=unknown
ENV GIT_USERNAME=Tergum
ENV GIT_EMAIL=bot@terg.um

ENV GIT_SSH_COMMAND='ssh -i /app_run/id_rsa -o IdentitiesOnly=yes -o StrictHostKeyChecking=no'

RUN apt update -y && apt -y install -qq --force-yes git cron
RUN mkdir -p /app && mkdir -p /app_run

COPY entry.sh /app_run/entry.sh
COPY backup.sh /app_run/backup.sh
COPY id_rsa /app_run/id_rsa
COPY backup-repository-cron /app_run/backup-repository-cron

RUN git config --global user.name ${GIT_USERNAME}
RUN git config --global user.email ${GIT_EMAIL}

RUN chmod +x /app_run/entry.sh
RUN chmod +x /app_run/backup.sh
RUN chmod 0400 /app_run/id_rsa
RUN chmod 0644 /app_run/backup-repository-cron

RUN crontab /app_run/backup-repository-cron

WORKDIR /app_run

RUN git clone git@github.com:jess-sys/dotfiles-ex.git /app_run/repository

CMD ["/app_run/entry.sh"]
