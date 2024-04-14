# Update System Script Documentation

This script is a simple bash script for updating the system. Here's a breakdown of what it does:

```bash
#!/bin/bash
```
This line is called a **shebang**. It determines the script's interpreter. In this case, the script will be run using `bash`.

```bash
echo "Updating system..."
```
The `echo` command is used to print its arguments to the standard output, which is usually the terminal. Here, it prints the string "Updating system...".

```bash
sudo apt-get update && sudo apt-get upgrade -y
```
This line is actually two commands, separated by `&&`. The `&&` operator allows you to execute a second command only if the first one succeeds.

- `sudo apt-get update`: This command retrieves the latest package lists from the repositories. `sudo` is used to run this command with root privileges.
- `sudo apt-get upgrade -y`: This command installs the newest versions of all packages currently installed on the system. The `-y` option is used to automatically answer yes to any prompts that may come up during the installation process.

```bash
echo "System updated!"
```
Finally, the script prints "System updated!" to indicate that the update process has been completed.