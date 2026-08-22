#!/usr/bin/env bash

# Load configuration if present
if [[ -f "config.conf" ]]; then
    source config.conf
fi

# Fallback default for LOG_DIR
LOG_DIR="${LOG_DIR:-logs}"
mkdir -p "$LOG_DIR"

print_header() {
    clear
    echo "==========================================="
    echo "      Linux Automation Toolkit"
    echo "==========================================="
    echo
}

success() {
    echo -e "\033[0;32m[SUCCESS]\033[0m $1"
}

error() {
    echo -e "\033[0;31m[ERROR]\033[0m $1"
}

warning() {
    echo -e "\033[1;33m[WARNING]\033[0m $1"
}

log_action() {
    echo "$(date '+%F %T') : $1" >> "$LOG_DIR/toolkit.log"
}