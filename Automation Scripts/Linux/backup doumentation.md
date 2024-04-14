# Backup Script Documentation

This script is a simple bash script for backing up the user's home directory, excluding the 'Downloads' directory. Here's a breakdown of what it does:

```bash
#!/bin/bash
```
This line is called a **shebang**. It determines the script's interpreter. In this case, the script will be run using `bash`.

```bash
BACKUP_DIR="$HOME/backup"
```
This line sets the variable `BACKUP_DIR` to the path of the backup directory, which is a subdirectory named 'backup' in the user's home directory.

```bash
echo "Starting backup..."
```
The `echo` command is used to print its arguments to the standard output, which is usually the terminal. Here, it prints the string "Starting backup...".

```bash
rsync -a --exclude 'Downloads' $HOME/ $BACKUP_DIR
```
This line uses the `rsync` command to synchronize files from the user's home directory (`$HOME/`) to the backup directory (`$BACKUP_DIR`). The `-a` option is for 'archive mode', which preserves symbolic links, file permissions, user & group ownership, and timestamps. The `--exclude 'Downloads'` option excludes the 'Downloads' directory from being backed up.

```bash
echo "Backup completed!"
```
Finally, the script prints "Backup completed!" to indicate that the backup process has been completed.