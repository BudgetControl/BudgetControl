#!/bin/bash

# Configurazione delle variabili
REMOTE_DB_HOST="127.0.0.1" # Il tunnel SSH reindirizza a questo host
REMOTE_DB_USER="jxavytw3wc"
REMOTE_DB_PASSWORD="SgT8xzjmmLwoU6--AVXgxdNYB8krIh9K"
REMOTE_DB_NAME="dt56qwjeg7" #Inserire il nome del database remoto
REMOTE_TABLE_NAME="dt56qwjeg7"
LOCAL_DB_HOST="127.0.0.1"
LOCAL_DB_USER="username" #Inserire il nome utente locale
LOCAL_DB_PASSWORD="passwordusername"
LOCAL_DB_NAME="budgetV2"
DUMP_FILE="dump_dt56qwjeg7.sql"

# Dump della tabella remota tramite il tunnel SSH
PGPASSWORD="$REMOTE_DB_PASSWORD" pg_dump -h "$REMOTE_DB_HOST" -p 54432 -U "$REMOTE_DB_USER" --no-acl "$REMOTE_DB_NAME" > "$DUMP_FILE"

# Svuota il database locale
PGPASSWORD="$LOCAL_DB_PASSWORD" psql -h "$LOCAL_DB_HOST" -U "$LOCAL_DB_USER" -d "$LOCAL_DB_NAME" -c "DROP SCHEMA public CASCADE;"
PGPASSWORD="$LOCAL_DB_PASSWORD" psql -h "$LOCAL_DB_HOST" -U "$LOCAL_DB_USER" -d "$LOCAL_DB_NAME" -c "CREATE SCHEMA public;"


# Ripristino del dump nel database locale
PGPASSWORD="$LOCAL_DB_PASSWORD" psql -h "$LOCAL_DB_HOST" -U "$LOCAL_DB_USER" -d "$LOCAL_DB_NAME" -f "$DUMP_FILE"

# Pulizia del file di dump (opzionale)
rm "$DUMP_FILE"

echo "Dump e ripristino completati."
