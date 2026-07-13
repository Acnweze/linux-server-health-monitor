#!/bin/bash

# Linux Server Health Monitoring Tool
# Module 1: Server Information Collection

REPORT="reports/health_report_$(date +%F).txt"

echo "===================================="
echo " Linux Server Health Monitor"
echo "===================================="

echo ""

echo "SERVER INFORMATION"
echo "------------------"

echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Operating System: $(lsb_release -d | cut -f2)"
echo "Kernel Version: $(uname -r)"
echo "System Uptime: $(uptime -p)"
echo "Date: $(date)"

echo ""

# Module 2: Resource Monitoring

echo "RESOURCE MONITORING"
echo "-------------------"

# CPU Load Check
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

echo "CPU Usage: ${CPU_USAGE}%"

if (( ${CPU_USAGE%.*} > 80 )); then
    echo "WARNING: High CPU Usage"
else
    echo "CPU Status: HEALTHY"
fi


echo ""

# Memory Usage Check
MEMORY_USAGE=$(free | grep Mem | awk '{print ($3/$2)*100.0}')

echo "Memory Usage: ${MEMORY_USAGE}%"

if (( ${MEMORY_USAGE%.*} > 80 )); then
    echo "WARNING: High Memory Usage"
else
    echo "Memory Status: HEALTHY"
fi


echo ""

# Disk Usage Check
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "Disk Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: Disk Space Low"
else
    echo "Disk Status: HEALTHY"
fi

echo ""
