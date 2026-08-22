#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/common.sh" ]]; then
    source "$SCRIPT_DIR/common.sh"
elif [[ -f "$SCRIPT_DIR/../common.sh" ]]; then
    source "$SCRIPT_DIR/../common.sh"
fi

print_header
echo "          System Dashboard"
echo "==========================================="

# Using parameter expansion and graceful fallbacks
OS_NAME=$(grep PRETTY_NAME /etc/os-release 2>/dev/null | cut -d= -f2 | tr -d '"' || echo "Unknown Linux")
UPTIME=$(uptime -p 2>/dev/null || echo "Uptime unavailable")
IP_ADDR=$(hostname -I 2>/dev/null | awk '{print $1}' || echo "No IP found")

printf "%-20s : %s\n" "Hostname" "$(hostname)"
printf "%-20s : %s\n" "Current User" "$(whoami)"
printf "%-20s : %s\n" "Operating System" "$OS_NAME"
printf "%-20s : %s\n" "Kernel Version" "$(uname -r)"
printf "%-20s : %s\n" "Architecture" "$(uname -m)"
printf "%-20s : %s\n" "System Uptime" "$UPTIME"
printf "%-20s : %s\n" "Primary IP" "$IP_ADDR"

echo "==========================================="
log_action "System Info dashboard viewed."