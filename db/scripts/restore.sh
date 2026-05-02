#!/bin/sh

DB_HOST="postgres-db"
DB_NAME=${POSTGRES_DB:-postgres}
DB_USER=${POSTGRES_USER:-postgres}
BACKUP_DIR="/backup"

# ถ้ามี argument → ใช้ไฟล์นั้น
if [ -n "$1" ]; then
  FILE="$1"
else
  # หาไฟล์ล่าสุด
  FILE=$(ls -t $BACKUP_DIR/*.dump.gz 2>/dev/null | head -n 1)
fi

if [ -z "$FILE" ]; then
  echo "No backup file found ❌"
  exit 1
fi

echo "Restoring from $FILE..."

# recreate db
psql -h $DB_HOST -U $DB_USER -c "DROP DATABASE IF EXISTS $DB_NAME;"
psql -h $DB_HOST -U $DB_USER -c "CREATE DATABASE $DB_NAME;"

# restore
gunzip -c "$FILE" | pg_restore -h $DB_HOST -U $DB_USER -d $DB_NAME

echo "Restore completed ✅"