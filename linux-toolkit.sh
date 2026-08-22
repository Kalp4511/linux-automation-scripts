#!/usr/bin/env bash

# Source common utilities
source scripts/common.sh

VERSION=$(cat VERSION 2>/dev/null || echo "1.0.0")

while true; do
    print_header
    echo "  Version: $VERSION"
    echo "==========================================="
    echo "1. System Information"
    echo "2. Disk Usage Monitor"
    echo "3. Memory Usage"
    echo "4. Network Diagnostics"
    echo "5. Backup Manager"
    echo "6. System Audits (Users & Permissions)"
    echo "7. Exit"
    echo
    
    read -rp "Select an option [1-7]: " choice
    
    case $choice in
        1) bash scripts/system_info.sh ;;
        2) bash scripts/monitoring/disk_usage.sh ;;
        3) bash scripts/monitoring/memory_usage.sh ;;
        4) bash scripts/networking/network_info.sh ;;
        5) bash scripts/automation/backup_manager.sh ;;
        6) 
           bash scripts/security/user_audit.sh
           bash scripts/security/permission_audit.sh 
           ;;
        7) success "Exiting Toolkit."; exit 0 ;;
        *) error "Invalid option. Please try again." ;;
    esac
    
    echo
    read -rp "Press Enter to return to menu..."
done