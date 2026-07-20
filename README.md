# Automated System Health Monitor

A lightweight, production-ready **Bash script** designed to automate server infrastructure monitoring. It tracks core performance metrics (CPU, RAM, and Disk usage) in real time and logs automated system alerts when system thresholds are breached.

---

## Features:
* **Real-time CPU Tracking:** Automatically calculates actual core utilization percentages.
* **Memory Management Logs:** Analyzes system active/total RAM consumption ratios.
* **Storage Threshold Alerts:** Monitors the root partition `/` to prevent system crashes from space exhaustion.
* **Persistent Logging:** Dynamically appends warning flags directly to localized host diagnostics logs (`/var/log/system_health.log`).

## Requirements & Environment:
* **OS:** Linux (Ubuntu / Debian / CentOS / RHEL)
* **Shell:** Bash Shell (`/bin/bash`)
* **Privileges:** Standard user access (Requires `sudo` permissions only if writing to `/var/log`).

## Local Installation & Setup

1. **Clone the repository to your host node:**
   ```bash
   git clone [https://github.com/abdulraheem774/automated-system-health-monitor.git](https://github.com/abdulraheem774/automated-system-health-monitor.git)
   cd automated-system-health-monitor
2. **Make the script executable:**
   ```bash
   chmod +x monitor.sh
3. **Run the monitor script:**
   ```bash
   ./monitor.sh

## Output

When you run the script, it displays the following metrics in the terminal:

```text
========================================
 Starting System Health Monitoring 
 Time: Mon Jul 20 10:52:38 PKT 2026
========================================
CPU Usage: 24%
RAM Usage: 62%
Disk Usage: 45%
----------------------------------------
Monitoring Cycle Completed. Logs saved to: /home/user/system_health.log
========================================
