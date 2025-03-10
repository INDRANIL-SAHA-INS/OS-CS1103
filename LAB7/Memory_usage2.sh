#!/bin/bash

# Function to display current memory usage
display_memory_usage() {
    echo "Current memory usage: "
    free -h
    echo ""
}

# Function to display memory usage in real-time
monitor_memory_usage() {
    echo "Monitoring memory usage in real-time. Press (CTRL+C) to stop."
    top -o %MEM
}

# Function to log memory usage every 10 seconds into a file with timestamp
log_memory_usage() {
    echo "Logging memory usage every 10 seconds into memory_log.txt. Press (CTRL+C) to stop."
    while true; do
        timestamp=$(date '+%Y-%m-%d %H:%M:%S')  # Get current timestamp
        memory_info=$(free -h)  # Get memory usage info
        echo "$timestamp - $memory_info" >> memory_log.txt  # Log the timestamp and memory usage to file
        echo "Logged memory usage at $timestamp"
        sleep 10  # Sleep for 10 seconds
    done
}

# Function to check if available memory is below a specified threshold
check_memory_threshold() {
    threshold=200  # Set threshold (200 MB)
    available_memory=$(free -m | awk 'NR==2{print $4}')  # Get available memory in MB (free -m)
    
    if [ "$available_memory" -lt "$threshold" ]; then
        echo "ALERT: Available memory is below $threshold MB. Current available memory: $available_memory MB"
        
        # Send email alert (optional, requires mail setup)
        # Uncomment and configure the line below if you want email alerts
        # echo "ALERT: Available memory is below $threshold MB. Current available memory: $available_memory MB" | mail -s "Memory Usage Alert" your-email@example.com
    fi
}

# Displaying the options to the user
echo "Dynamic Memory Monitor"
echo "1. Display current memory usage"
echo "2. Monitor memory usage in real-time"
echo "3. Log memory usage to file every 10 seconds"
echo "4. Check memory usage and alert if below threshold"
echo "5. Exit"

# Loop until user chooses to exit
while true; do
    read -p "Select an option (1-5):" option
    case $option in
        1)
            display_memory_usage
            ;;
        2)
            monitor_memory_usage
            ;;
        3)
            log_memory_usage  # Start logging memory usage
            ;;
        4)
            check_memory_threshold  # Check memory threshold and alert if needed
            ;;
        5)
            echo "Exiting the memory monitor. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1-5."
            ;;
    esac
    echo ""
done
