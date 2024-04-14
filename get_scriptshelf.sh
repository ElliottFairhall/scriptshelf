#!/bin/bash

# Function to log messages
log_message() {
    echo "$(date) - $1"
}

# Ask the user for the GitHub repository URL
read -p "Enter the GitHub repository URL: " REPO_URL

# Ask the user for the directory name where the scripts will be saved
read -p "Enter a name for the local script directory: " DIR_NAME

# Clone the repository
git clone "$REPO_URL" "$DIR_NAME"
log_message "Cloned repository into directory: $DIR_NAME"

# Navigate to the directory
cd "$DIR_NAME"

# Make all script files executable
find . -type f -iname "*.sh" -exec chmod +x {} \;
log_message "All script files in $DIR_NAME are now executable."

# Inform the user
echo "Scripts from the repository have been cloned and made executable in the directory: $DIR_NAME"