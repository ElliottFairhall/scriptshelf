#!/bin/bash

# Script to create aliases for scripts in a specified directory on Mint Linux

echo "Enter the full path of the script directory:"
read script_dir

# Check if the directory exists
if [ ! -d "$script_dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

# Loop through each file in the directory
for script in "$script_dir"/*; do
    if [ -f "$script" ]; then
        script_name=$(basename "$script")
        echo "Create alias for $script_name? (y/n)"
        read answer
        if [ "$answer" = "y" ]; then
            # Add alias to .bashrc
            echo "alias ${script_name%.*}='$script'" >> ~/.bashrc
            echo "Alias created for $script_name"
        fi
    fi
done

# Apply the changes
source ~/.bashrc
echo "All selected aliases have been created."
