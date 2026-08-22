#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

echo "========== Network Diagnostics =========="

echo "[Active Interfaces & IPs]"
# Parse 'ip addr' to only show interfaces that are UP and have an IP address
ip -br addr show | awk '$2 == "UP" {print " - " $1 ": " $3}'

echo -e "\n[Default Gateway]"
ip route | grep default | awk '{print " - " $3 " (via " $5 ")"}'

echo -e "\n[DNS Servers]"
if [[ -f /etc/resolv.conf ]]; then
    grep "^nameserver" /etc/resolv.conf | awk '{print " - " $2}'
else
    echo " - DNS information unavailable."
fi

log_action "Network diagnostics run."