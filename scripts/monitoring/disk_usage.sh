#!/bin/bash

# =====================================================
# Linux Automation Toolkit
# Module: Disk Usage Monitor
# Description: Displays disk usage and warns if any
# filesystem exceeds the threshold.
# Author: Kalp Gandhi
# =====================================================

THRESHOLD=80

echo "==============================================="
echo "           Disk Usage Monitor"
echo "==============================================="
echo

df -h --output=source,size,used,avail,pcent,target | while read filesystem size used avail percent mount
do
    if [[ "$filesystem" == "Filesystem" ]]; then
        printf "%-20s %-8s %-8s %-8s %-8s %-15s\n" \
        "$filesystem" "$size" "$used" "$avail" "$percent" "$mount"
        continue
    fi

    usage=${percent%\%}

    printf "%-20s %-8s %-8s %-8s %-8s %-15s\n" \
    "$filesystem" "$size" "$used" "$avail" "$percent" "$mount"

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "WARNING: $filesystem is above ${THRESHOLD}% usage."
    fi
done

echo
echo "Disk scan completed."
