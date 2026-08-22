#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

SOURCE_DIR="$HOME/Documents"
DESTINATION="${BACKUP_DIR:-$HOME/backups}"
TIMESTAMP=$(date +%F_%H-%M-%S)
ARCHIVE="$DESTINATION/backup_$TIMESTAMP.tar.gz"

echo "========== Backup Manager =========="

if [[ ! -d "$SOURCE_DIR" ]]; then
    error "Source directory $SOURCE_DIR does not exist."
    exit 1
fi

if tar -czf "$ARCHIVE" "$SOURCE_DIR" 2>/dev/null; then
    success "Backup created at $ARCHIVE"
    log_action "Backup successful: $ARCHIVE"
else
    error "Backup failed."
    log_action "Backup failed for source: $SOURCE_DIR"
    exit 1
fi