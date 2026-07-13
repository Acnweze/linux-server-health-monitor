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
