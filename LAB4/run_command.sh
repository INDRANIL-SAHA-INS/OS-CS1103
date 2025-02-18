#!/bin/bash

# First argument is delay (in seconds)
delay=$1

# Shift to remove the delay argument
shift

# Loop through all the commands passed after the delay
for command in "$@"; do
  echo "Executing: $command"
  eval "$command"  # Execute the command
  sleep "$delay"   # Wait for the specified delay
done

