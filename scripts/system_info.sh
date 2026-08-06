#!/bin/bash

# ======================================================
# Linux Automation Scripts
# Script: system_info.sh
# Description: Displays essential Linux system information
# Author: Kalp Gandhi
# ======================================================

print_line() {
    printf '=%.0s' {1..55}
    echo
}

print_line
echo "            Linux System Information"
print_line

echo "Hostname        : $(hostname)"
echo "Current User    : $(whoami)"
echo "Operating System: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel Version  : $(uname -r)"
echo "Architecture    : $(uname -m)"
echo "Current Time    : $(date)"
echo "System Uptime   : $(uptime -p)"

echo
echo "Disk Usage"
df -h / | awk 'NR==2 {print "  Used: "$3" / "$2" ("$5")"}'

echo
echo "Memory Usage"
free -h | awk 'NR==2 {print "  Used: "$3" / "$2}'

echo
echo "IP Address"
hostname -I

print_line
echo "System information collected successfully."
print_line
