#!/usr/bin/env bash
set -euo pipefail

source scripts/common.sh

echo "========== Temp File Cleaner =========="
echo "Scanning /tmp for files older than 7 days..."
echo "-------------------------------------------"

# Use find securely. Suppress permission denied errors which are normal in /tmp
if find /tmp -type f -mtime +7 -delete 2>/dev/null; then
    success "Old temporary files cleaned."
    log_action "Temp files cleaned successfully."
else
    warning "Some files could not be removed (standard permission limits)."
    log_action "Temp file cleaner ran with partial permissions."
fi