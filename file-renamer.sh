#!/bin/bash


folder="/path/to/your/folder"

if [ ! -d "$folder" ]; then
    echo "Folder not found: $folder"
    exit 1
fi

read -p "Enter the file extension (e.g., jpg, txt): " file_extension

cd "$folder"

for file in *."$file_extension"; do
    if [ -f "$file" ]; then
        modification_date=$(stat -c %Y "$file")

        new_name=$(date -d "@$modification_date" "+%Y%m%d-%H%M%S")

        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
    fi
done

echo "File renaming complete."
