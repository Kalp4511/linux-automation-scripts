#!/bin/bash

SOURCE=$HOME

DESTINATION="$HOME/backups"

mkdir -p "$DESTINATION"

tar -czf "$DESTINATION/backup_$(date +%F_%H-%M-%S).tar.gz" "$SOURCE"

echo "Backup completed."
