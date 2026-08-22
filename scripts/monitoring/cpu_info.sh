#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

echo "========== CPU Information =========="

# Extract only the most relevant hardware details
lscpu | grep -E "^(Architecture|CPU\(s\)|Thread\(s\) per core|Core\(s\) per socket|Model name)"

echo "-------------------------------------------"
log_action "CPU information queried."