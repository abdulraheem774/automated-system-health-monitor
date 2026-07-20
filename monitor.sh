#!/bin/bash

# Configuration settings
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=85

# Log File Path
LOG_FILE="/var/log/system_health.log"

# Fallback if cannot write to /var/log
[ ! -w "/var/log" ] && LOG_FILE="$HOME/system_health.log"

echo "========================================"
echo " Starting System Health Monitoring "
echo " Time: $(date)"
echo "========================================"

# 1. CPU Metric Verification
# Using 'awk' command
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc 2>/dev/null || awk "BEGIN {print 100 - $CPU_IDLE}")
CPU_USAGE_INT=${CPU_USAGE%.*}

echo "CPU Usage: $CPU_USAGE_INT%"

if [ "$CPU_USAGE_INT" -gt "$CPU_THRESHOLD" ]; then
    ALERT_MSG="[ALERT] $(date): High CPU Usage detected: $CPU_USAGE_INT%"
    echo "$ALERT_MSG" | tee -a "$LOG_FILE"
fi

# 2. Memory Metric Verification
RAM_USAGE_INT=$(free | grep Mem | awk '{print int($3/$2 * 100)}')

echo "RAM Usage: $RAM_USAGE_INT%"

if [ "$RAM_USAGE_INT" -gt "$RAM_THRESHOLD" ]; then
    ALERT_MSG="[ALERT] $(date): High RAM Usage detected: $RAM_USAGE_INT%"
    echo "$ALERT_MSG" | tee -a "$LOG_FILE"
fi

# 3. Root Storage Verification
DISK_USAGE_INT=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk Usage: $DISK_USAGE_INT%"

if [ "$DISK_USAGE_INT" -gt "$DISK_THRESHOLD" ]; then
    ALERT_MSG="[ALERT] $(date): High Disk Usage detected: $DISK_USAGE_INT%"
    echo "$ALERT_MSG" | tee -a "$LOG_FILE"
fi

echo "----------------------------------------"
echo "Monitoring Cycle Completed. Logs saved to: $LOG_FILE"
echo "========================================"
