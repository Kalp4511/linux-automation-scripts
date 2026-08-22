# Linux Automation & Security Toolkit

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Security](https://img.shields.io/badge/Security-Audit-blue?style=for-the-badge)

A modular, production-ready Bash toolkit designed for Linux system administration, security auditing, and automated monitoring.

## 🚀 Features

* **System Dashboard:** Real-time OS, kernel, memory, and uptime metrics.
* **Security Auditing:** Scans for world-writable files and audits active interactive system users.
* **Resource Monitoring:** Threshold-based disk usage alerts (safely excluding virtual filesystems).
* **Network Diagnostics:** IP routing, interface status, and DNS configuration extraction.
* **Automated Backups:** Tar-based archive generation with dynamic pathing.
* **Centralized Logging:** All module executions and errors are automatically timestamped and logged.

## 📁 Architecture

```text
linux-automation-scripts/
├── config.conf            # Global variables and thresholds
├── install.sh             # Environment setup and permission handling
├── linux-toolkit.sh       # Main interactive CLI menu
├── VERSION                # Release tracking
├── logs/                  # Centralized execution logs
└── scripts/
    ├── common.sh          # Reusable UI and logging functions
    ├── system_info.sh     # System dashboard module
    ├── automation/        # Backup and cron-related tasks
    ├── monitoring/        # Disk and memory resource trackers
    ├── networking/        # IP and routing diagnostics
    └── security/          # User and file permission audits