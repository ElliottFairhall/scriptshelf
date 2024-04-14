# Open Documents Script Documentation

This script is a simple bash script for opening the 'Documents' directory in the user's home directory. Here's a breakdown of what it does:

```bash
#!/bin/bash
```
This line is called a **shebang**. It determines the script's interpreter. In this case, the script will be run using `bash`.

```bash
echo "Opening Documents..."
```
The `echo` command is used to print its arguments to the standard output, which is usually the terminal. Here, it prints the string "Opening Documents...".

```bash
xdg-open $HOME/Documents
```
This line uses the `xdg-open` command to open the 'Documents' directory in the user's home directory (`$HOME/Documents`). `xdg-open` is a command that opens a file or URL in the user's preferred application.