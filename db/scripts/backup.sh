#!/bin/sh
set -e

DB_HOST="postgres-db"
DB_NAME=${POSTGRES_DB:-postgres}
DB_USER=${POSTGRES_USER:-postgres}
BACKUP_DIR="/backup"
LOG_FILE="/backup/backup.log"

export PGPASSWORD=$PGPASSWORD

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILE="$BACKUP_DIR/backup_$TIMESTAMP.dump.gz"

echo "[$(date)] Starting backup..." >> "$LOG_FILE"

pg_dump -h "$DB_HOST" -U "$DB_USER" "$DB_NAME" \
  | gzip > "$FILE"

echo "[$(date)] Backup saved: $FILE" >> "$LOG_FILE"

find "$BACKUP_DIR" -type f -name "*.dump.gz" -mtime +7 -delete

echo "[$(date)] Cleanup completed" >> "$LOG_FILE"