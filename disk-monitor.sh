#!/bin/bash

# Linux Disk Usage Monitoring Script
# Description: Alerts when root filesystem
# usage reaches the configured threshold.

THRESHOLD=80

echo "================================"
echo "Linux Disk Usage Monitoring"
echo "================================"

# Get root filesystem disk usage
DISK_USAGE=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "Disk usage: ${DISK_USAGE}%"
echo "Threshold: ${THRESHOLD}%"

# Check disk usage
if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
    echo "WARNING: Disk usage has reached the threshold!"
    exit 1
else
    echo "OK: Disk usage is within the threshold."
    exit 0
fi
