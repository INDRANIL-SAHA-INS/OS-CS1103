#!/bin/bash

# Get the source file and destination directory from arguments
source_file=$1
destination=$2

# Check if the source file exists
if [ ! -f "$source_file" ]; then
  echo "Error: Source file '$source_file' does not exist."
  exit 1
fi

# Check if the destination is a directory
if [ ! -d "$destination" ]; then
  echo "Error: Destination '$destination' is not a valid directory."
  exit 1
fi

# Move the file to the destination
mv "$source_file" "$destination"

# Check if the move was successful
if [ $? -eq 0 ]; then
  echo "File '$source_file' moved successfully to '$destination'."
else
  echo "Error: Failed to move the file."
  exit 1
fi

