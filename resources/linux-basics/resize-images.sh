#!/bin/bash

read -p "Enter the name of the directory: " dirname
read -p "Enter the desired width of images: " width

for file in $dirname/*.{jpg,png,jpeg}; do
  if [ -f "$file" ]; then
    echo "Resizing $file..."
    convert "$file" -resize "$width" "$file"
  fi
done

echo "All images in $dirname have been resized to $width pixels wide."
