#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

echo "========== Memory & Swap Usage =========="
# Shows memory hierarchy usage cleanly
free -h | awk '
NR==1 {printf "%-15s %-10s %-10s %-10s\n", "", "Total", "Used", "Free"}
NR==2 {printf "%-15s %-10s %-10s %-10s\n", "RAM:", $2, $3, $4}
NR==3 {printf "%-15s %-10s %-10s %-10s\n", "Swap:", $2, $3, $4}
'