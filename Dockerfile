FROM alpine

ENV GITHUB_REPOSITORY_URL
ENV GITHUB_USERNAME=Tergum
ENV GITHUB_EMAIL=bot@terg.um

RUN apt-get update && apt-get -y install -qq --force-yes git cron
RUN mkdir -p /app && mkdir -p /app_run

COPY backup.sh /app_run/backup.sh
COPY id_rsa /app_run/id_rsa
COPY backup-repository-cron /etc/cron.d/backup-repository-cron

RUN git config --global user.name ${GITHUB_USERNAME}
RUN git config --global user.email ${GITHUB_EMAIL}
RUN git config core.sshCommand "ssh -i /app_run/id_rsa -F /dev/null"

RUN chmod 0644 /etc/cron.d/backup-repository-cron
RUN crontab /etc/cron.d/backup-repository-cron
RUN touch /var/log/cron.log

WORKDIR /app_run
CMD git clone ${GITHUB_REPOSITORY_URL} repository

CMD /app_run/backup.sh

CMD cron && tail -f /var/log/cron.log
