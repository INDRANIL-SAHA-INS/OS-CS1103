#!/bin/bash

# Get the file to delete from the argument
file_to_delete=$1

# Check if the file exists
if [ ! -f "$file_to_delete" ]; then
  echo "Error: File '$file_to_delete' does not exist."
  exit 1
fi

# Delete the file
rm "$file_to_delete"

# Check if the file was successfully deleted
if [ $? -eq 0 ]; then
  echo "File '$file_to_delete' deleted successfully!"
else
  echo "Error: Failed to delete the file."
  exit 1
fi

