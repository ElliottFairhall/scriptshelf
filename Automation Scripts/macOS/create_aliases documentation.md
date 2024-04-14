# Alias Creation Script Documentation

This Bash script is designed to create aliases for scripts in a specified directory on Linux/macOS. Here's a step-by-step breakdown of how it works:

## 1. Prompt for Script Directory

The script begins by prompting the user to enter the full path of the directory containing the scripts:

```bash
echo "Enter the full path of the script directory:"
read script_dir
```

The `read` command captures the user's input and stores it in the `script_dir` variable.

## 2. Determine Shell and Configuration File

The script determines which shell the user is using and sets the `config_file` variable to the appropriate shell configuration file:

```bash
if [ -n "$ZSH_VERSION" ]; then
   config_file=~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
   config_file=~/.bashrc
else
   echo "Unsupported shell."
   exit 1
fi
```

If the shell is neither Zsh nor Bash, the script prints a message and exits with a status of 1.

## 3. Directory Existence Check

The script checks if the directory entered by the user exists:

```bash
if [ ! -d "$script_dir" ]; then
    echo "Directory does not exist."
    exit 1
fi
```

If the directory does not exist, the script prints a message and exits with a status of 1.

## 4. Loop Through Files in the Directory

The script then loops through each file in the directory:

```bash
for script in "$script_dir"/*; do
    ...
done
```

## 5. File Existence Check and Alias Creation

Inside the loop, the script checks if the current item is a file:

```bash
if [ -f "$script" ]; then
    ...
fi
```

If it is a file, the script extracts the filename without the extension using `basename "$script"`, prompts the user to confirm if they want to create an alias for this script, and if the user answers 'y', it adds an alias to the shell configuration file:

```bash
script_name=$(basename "$script")
echo "Create alias for $script_name? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "alias ${script_name%.*}='$script'" >> "$config_file"
    echo "Alias created for $script_name"
fi
```

## 6. Apply Changes

Finally, the script applies the changes by sourcing the shell configuration file and prints a confirmation message:

```bash
source "$config_file"
echo "All selected aliases have been created."
```

This script is a handy tool for quickly creating aliases for a collection of scripts, making them easier to run from the command line.
