#!/bin/bash

clear

echo "==========================================="
echo "      Linux Automation Toolkit v1.0"
echo "==========================================="
echo
echo "1. System Information"
echo "2. Disk Usage Monitor"
echo "3. Backup Manager"
echo "4. Network Diagnostics"
echo "5. User Audit"
echo "6. Exit"
echo

read -p "Select an option: " choice

case $choice in
    1)
        bash scripts/system_info.sh
        ;;
    2)
        echo "Coming Soon"
        ;;
    3)
        echo "Coming Soon"
        ;;
    4)
        echo "Coming Soon"
        ;;
    5)
        echo "Coming Soon"
        ;;
    6)
        exit
        ;;
    *)
        echo "Invalid option."
        ;;
esac
