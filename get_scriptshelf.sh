#!/bin/bash

# Function to log messages
log_message() {
    local MESSAGE=$1
    TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`
    echo "$TIMESTAMP - $MESSAGE"
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    log_message "git is not installed. Please install git and try again."
    exit 1
fi

# Default GitHub repository URL
DEFAULT_REPO_URL="https://github.com/ElliottFairhall/scriptshelf"

# Ask the user for the GitHub repository URL
read -p "Enter the GitHub repository URL (or press enter to use the default: $DEFAULT_REPO_URL): " REPO_URL

# Use the default URL if the user didn't provide one
if [[ -z "$REPO_URL" ]]; then
    REPO_URL=$DEFAULT_REPO_URL
fi

# Validate the GitHub repository URL
if [[ ! "$REPO_URL" =~ ^https://github.com/([[:alnum:]]|-|_)+/([[:alnum:]]|-|_)+/?$ ]]; then
    log_message "Invalid GitHub repository URL. Please enter a valid URL."
    exit 1
fi

# Ask the user for the directory name where the scripts will be saved
read -p "Enter a name for the local script directory: " DIR_NAME

# Validate the directory name
if [[ ! "$DIR_NAME" =~ ^[[:alnum:]]+$ ]]; then
    log_message "Invalid directory name. Please enter a valid name."
    exit 1
fi

# Check if the directory already exists
if [ -d "$DIR_NAME" ]; then
    # Navigate to the directory
    cd "$DIR_NAME" || exit

    # Pull the latest changes
    if git pull; then
        log_message "Updated the repository in directory: $DIR_NAME"
    else
        log_message "Failed to update the repository. Please check your internet connection."
        exit 1
    fi
else
    # Clone the repository
    if git clone "$REPO_URL" "$DIR_NAME"; then
        log_message "Cloned repository into directory: $DIR_NAME"
    else
        log_message "Failed to clone repository. Please check the repository URL and your internet connection."
        exit 1
    fi

    # Navigate to the directory
    cd "$DIR_NAME" || exit
fi

# Make all script files executable
find . -type f -iname "*.sh" -exec chmod +x {} \; || log_message "Failed to make script files executable."

log_message "All script files in $DIR_NAME are now executable."

# Inform the user
echo "Scripts from the repository have been cloned or updated and made executable in the directory: $DIR_NAME"
