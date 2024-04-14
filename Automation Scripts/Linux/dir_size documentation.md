# Directory Size Script Documentation

This script is a simple bash script for checking the size of a directory. Here's a breakdown of what it does:

```bash
#!/bin/bash
```
This line is called a **shebang**. It determines the script's interpreter. In this case, the script will be run using `bash`.

```bash
echo "Enter directory path:"
```
The `echo` command is used to print its arguments to the standard output, which is usually the terminal. Here, it prints the string "Enter directory path:".

```bash
read dir
```
The `read` command reads a line from the standard input (the terminal in this case) and assigns it to the variable `dir`.

```bash
du -sh $dir
```
This line uses the `du` command to estimate file and directory space usage. The `-s` option is for summarizing and only provides a total for each argument. The `-h` option is for human-readable print sizes in human-readable format (e.g., KB, MB).