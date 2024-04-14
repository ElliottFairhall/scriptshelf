#!/bin/bash

# Script to create aliases for scripts in a specified directory on Linux/macOS

echo "Enter the full path of the script directory:"
read script_dir

# Determine which shell the user is using
if [ -n "$ZSH_VERSION" ]; then
   config_file=~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
   config_file=~/.bashrc
else
   echo "Unsupported shell."
   exit 1
fi

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
            # Add alias to the shell configuration file
            echo "alias ${script_name%.*}='$script'" >> "$config_file"
            echo "Alias created for $script_name"
        fi
    fi
done

# Apply the changes
source "$config_file"
echo "All selected aliases have been created."