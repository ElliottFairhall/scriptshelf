# System Information Gathering Script Documentation

This script is a simple bash script for gathering system information. Here's a breakdown of what it does:

```bash
#!/bin/bash
```
This line is called a **shebang**. It determines the script's interpreter. In this case, the script will be run using `bash`.

```bash
echo "Gathering system information..."
```
The `echo` command is used to print its arguments to the standard output, which is usually the terminal. Here, it prints the string "Gathering system information...".

```bash
lscpu && free -h && df -h
```
This line is actually three commands, separated by `&&`. The `&&` operator allows you to execute a second command only if the first one succeeds.

- `lscpu`: This command displays information about the CPU architecture.
- `free -h`: This command displays the amount of free and used memory in the system in a human-readable format (`-h` option).
- `df -h`: This command reports the amount of disk space used and available on filesystems in a human-readable format (`-h` option).

```bash
echo "Information collected!"
```
Finally, the script prints "Information collected!" to indicate that the information gathering process has been completed.