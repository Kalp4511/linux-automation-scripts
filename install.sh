#!/usr/bin/env bash
set -euo pipefail

echo "Setting up Linux Automation Toolkit..."

# Create necessary directories
mkdir -p logs backups

# Make all shell scripts executable
find . -type f -name "*.sh" -exec chmod +x {} \;

# Check for required utilities
for cmd in df free tar curl ip; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "[WARNING] Required command '$cmd' is not installed."
    fi
done

echo "[SUCCESS] Installation complete. Run ./linux-toolkit.sh to start."