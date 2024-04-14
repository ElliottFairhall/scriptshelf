#!/bin/bash
NOTE_DIR="$HOME/notes"

if [ ! -d "$NOTE_DIR" ]; then
  mkdir -p "$NOTE_DIR"
fi

echo "Enter your note:"
read note
echo "$note" >> "$NOTE_DIR/$(date +%Y-%m-%d_%H-%M-%S).txt"
echo "Note saved!"
