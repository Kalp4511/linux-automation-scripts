#!/bin/bash

echo "=================================="
echo "      Linux System Information"
echo "=================================="

echo "Hostname      : $(hostname)"
echo "Current User  : $(whoami)"
echo "Kernel        : $(uname -r)"
echo "Date & Time   : $(date)"

echo
echo "========== Disk Usage =========="
df -h

echo
echo "========== Memory Usage =========="
free -h

echo
echo "========== IP Address =========="
hostname -I