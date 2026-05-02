#!/bin/sh

DB_HOST="postgres-db"
DB_NAME=${POSTGRES_DB}
DB_USER=${POSTGRES_USER}

TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "Running backup..."

pg_dump -h $DB_HOST -U $DB_USER $DB_NAME \
  | gzip > /backup/backup_$TIMESTAMP.dump.gz

echo "Backup done!"

# ลบไฟล์เก่า
find /backup -type f -mtime +7 -name "*.dump.gz" -delete