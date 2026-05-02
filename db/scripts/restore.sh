#!/bin/bash

CONTAINER="postgres-db"
DB_NAME=${POSTGRES_DB:-mydb}
DB_USER=${POSTGRES_USER:-postgres}
BACKUP_DIR="./db/backup"

# ถ้ามี argument → ใช้ไฟล์นั้น
if [ -n "$1" ]; then
  FILE="$1"
else
  # auto: หาไฟล์ล่าสุด
  FILE=$(ls -t $BACKUP_DIR/*.dump 2>/dev/null | head -n 1)
fi

if [ -z "$FILE" ]; then
  echo "No backup file found ❌"
  exit 1
fi

echo "Using backup file: $FILE"

echo "Dropping database..."
docker exec -i $CONTAINER psql -U $DB_USER -c "DROP DATABASE IF EXISTS $DB_NAME;"

echo "Creating database..."
docker exec -i $CONTAINER psql -U $DB_USER -c "CREATE DATABASE $DB_NAME;"

echo "Restoring..."
cat $FILE | docker exec -i $CONTAINER pg_restore -U $DB_USER -d $DB_NAME

echo "Restore completed ✅"