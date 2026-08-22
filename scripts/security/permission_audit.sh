#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

echo "========== Permission Audit =========="
echo "Scanning for world-writable files..."
echo "(Excluding /proc, /sys, /dev, /run, and /mnt Windows drives)"
echo "-------------------------------------------"

# Exclude virtual filesystems AND WSL Windows mounts (/mnt)
find / -type d \( -path /proc -o -path /sys -o -path /dev -o -path /run -o -path /mnt \) -prune -o \
       -type f -perm -0002 -exec ls -lh {} + 2>/dev/null | awk '{print $9}' || true

echo "-------------------------------------------"
success "Audit complete."
log_action "World-writable file audit executed."