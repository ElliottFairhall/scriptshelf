#!/bin/bash
TODO_FILE="$HOME/todo.txt"
echo "1) Add a to-do 2) View to-dos"
read option
if [ "$option" == "1" ]; then
  echo "Enter a to-do item:"
  read item
  echo "$item" >> $TODO_FILE
  echo "To-do added!"
elif [ "$option" == "2" ]; then
  cat $TODO_FILE
else
  echo "Invalid option."
fi
