#!/bin/bash

# Get the source file and destination from arguments
source_file=$1
destination=$2

# Copy the source file to the destination
cp "$source_file" "$destination"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "File copied successfully!"
else
  echo "Error: Failed to copy the file."
  exit 1
fi

