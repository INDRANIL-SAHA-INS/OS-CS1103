#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <source_file> <destination>"
  exit 1
fi

# Get the source file and destination from arguments
source_file=$1
destination=$2

# Check if the source file exists
if [ ! -f "$source_file" ]; then
  echo "Error: Source file does not exist."
  exit 1
fi

# Copy the source file to the destination
cp "$source_file" "$destination"

# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "File copied successfully!"
else
  echo "Error: Failed to copy the file."
  exit 1
fi

