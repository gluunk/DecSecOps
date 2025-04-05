# Dockerfile (dentro da pasta backup/)

FROM python:3.8-slim

RUN apt-get update && \
    apt-get install -y cron && \
    mkdir -p /app/data /app/backup /backups

# Copia o script de backup
COPY backup.sh /app/backup/backup.sh

# Copia o cronjob
COPY cronjob /etc/cron.d/backup-cron
RUN chmod 0644 /etc/cron.d/backup-cron && \
    touch /var/log/cron.log

# Torna o script executável
RUN chmod +x /app/backup/backup.sh

CMD ["cron", "-f"]
