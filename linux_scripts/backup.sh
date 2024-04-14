#!/bin/bash
BACKUP_DIR="$HOME/backup"
echo "Starting backup..."
rsync -a --exclude 'Downloads' $HOME/ $BACKUP_DIR
echo "Backup completed!"