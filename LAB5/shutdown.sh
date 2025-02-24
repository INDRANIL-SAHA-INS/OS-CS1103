#!/bin/bash

# Ask the user for the date and time to schedule the shutdown
echo "Please enter the date when you want to shut down the computer (format: YYYY-MM-DD):"
read shutdown_date

echo "Please enter the time when you want to shut down the computer (format: HH:MM):"
read shutdown_time

# Combine the date and time into one variable
shutdown_datetime="$shutdown_date $shutdown_time"

# Check if the user provided both the date and time
if [ -z "$shutdown_date" ] || [ -z "$shutdown_time" ]; then
    echo "Error: Both date and time are required."
    exit 1
fi

# Use the 'at' command to schedule the shutdown
echo "sudo shutdown -h now" | at "$shutdown_datetime"

# Let the user know that the shutdown has been scheduled
echo "Shutdown has been scheduled for $shutdown_datetime"

