#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh
LIMIT=${DISK_THRESHOLD:-80}

echo "========== Disk Usage Monitor =========="

# We use awk to parse the df output cleanly, skipping virtual filesystems
df -h -T -x tmpfs -x devtmpfs | awk -v limit="$LIMIT" '
NR==1 {print $0; next}
{
    print $0
    usage = $6
    sub("%", "", usage)
    if (usage >= limit) {
        print "\033[1;33m[WARNING]\033[0m Partition " $1 " is at " $6 " capacity!"
    }
}'

log_action "Disk usage monitored."