#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

echo "========== System User Audit =========="

# Instead of just counting all users, a real audit looks for humans (users with shells)
echo "Active Interactive Users:"
awk -F: '$7 !~ /(nologin|false)$/ {print " - " $1 " (Home: " $6 ")"}' /etc/passwd

TOTAL=$(wc -l < /etc/passwd)
echo -e "\nTotal system accounts (including daemons/services): $TOTAL"

log_action "User audit executed."