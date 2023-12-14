#!/bin/bash

# Log file
log_file="/var/log/system_check.log"

# Email settings
recipient_email="mostafanaa1919@gmail.com"
subject="System Health Check Report"

# Function to log with timestamp
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") $1" >> "$log_file"
}

# Function to send email
send_email() {
    cat "$log_file" | mail -s "$subject" "$recipient_email"
}

while true; do
    # System Health Check

    log "=== Starting System Health Check ==="

    # Essential services check
    essential_services=("ssh" "http" "https" "mysql")
    for service in "${essential_services[@]}"; do
        if systemctl is-active --quiet $service; then
            log "$service is running."
        else
            log "$service is down."
        fi
    done

    # Disk usage check
    threshold=80
    df -h | awk '$5 > '$threshold' {print "Partition " $6 " is over '$threshold'% usage."}' | while read -r line; do
        log "$line"
    done

    # Read-only file systems check
    readonly_fs=$(mount | grep " ro,")
    if [ -n "$readonly_fs" ]; then
        log "Read-only file system(s) found."
    else
        log "No read-only file systems."
    fi

    # CPU and memory usage check
    cpu_threshold=50
    ram_threshold=2000000  # 2GB in kilobytes
    ps -eo pid,%cpu,%mem,cmd | awk '$2 > '$cpu_threshold' || $3 > '$ram_threshold' {print "High resource usage: PID=" $1 " CPU=" $2 "% RAM=" $3 "% Command=" $4}' | while read -r line; do
        log "$line"
    done

    # System logs analysis
    error_logs=$(grep -iE 'error|warning' /var/log/syslog)
    if [ -n "$error_logs" ]; then
        log "=== Error or Warning Messages in System Logs ==="
        log "$error_logs"
    else
        log "No error or warning messages in system logs."
    fi

    # Security Check

    log "=== Starting Security Check ==="

    # Failed SSH login sessions
    failed_ssh_logins=$(grep 'Failed password' /var/log/auth.log | awk '{print $1, $2, $3, $9}' | sort | uniq -c)
    if [ -n "$failed_ssh_logins" ]; then
        log "=== Failed SSH Login Attempts ==="
        log "$failed_ssh_logins"
    else
        log "No failed SSH login attempts."
    fi

    # Open ports scan
    open_ports=$(ss -tuln | awk '$1 == "LISTEN" {print $5}' | cut -d':' -f2)
    log "=== Open Ports ==="
    log "$open_ports"

    log "=== System Health Check and Security Check Completed ==="

    # Send email with the log report
    send_email

    # Sleep for 24 hours before running again
    sleep 86400  # 24 hours = 24 * 60 * 60 seconds
done
