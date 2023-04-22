#!/bin/bash
read -p "Enter the name of the directory: " dirname
read -p "Enter the prefix to be removed: " prefix

# Check if the given directory exists
if [ -d "$dirname" ]
then
  # Loop through all the files in the directory
  for file in "$dirname"/*"$prefix"*
  do
    # Remove prefix from filename
    newname=$(echo $file | sed "s/$prefix//")
    mv "$file" "$newname"
    echo "File $file renamed to $newname"
  done
else
  echo "Directory $dirname does not exist."
fi
