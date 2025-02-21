#!/bin/bash

# Ask for the directory path
read -p "Enter the directory where you want to rename files: " SPECIFIED_DIR

# Check if the directory exists
if [[ ! -d "$SPECIFIED_DIR" ]]; then
    echo "The specified directory does not exist."
    exit 1
fi


# Check if the directory is empty
if [[ -z "$(ls -A "$SPECIFIED_DIR")" ]]; then
    echo "The specified directory is empty."
    exit 1
fi

# Go to the user specified directory
cd "$SPECIFIED_DIR"

# Ask the user if they want to create .txt files
read -p "Do you want to create .txt files with the original file names? (yes/no): " CREATE_TXT
CREATE_TXT=$(echo "$CREATE_TXT" | tr '[:upper:]' '[:lower:]')

# Get a list of all files (excluding directories), sorted
mapfile -t files < <(ls -p | grep -v / | sort)

# Initialize counter
counter=1

# Process each file
for file in "${files[@]}"; do
    # Extract the extension (if any)
    ext="${file##*.}"
    base="${file%.*}"

    # Format counter as a four-digit number
    newname=$(printf "%06d" "$counter")

    # Preserve the extension if it exists
    if [[ "$file" == *.* && "$base" != "" ]]; then
        newfile="$newname.$ext"
    else
        newfile="$newname"
    fi

    # Rename the file
    mv "$file" "$newfile"

    # Create a .txt file if the user chose to
    if [[ "$CREATE_TXT" == "yes" ]]; then
        # index: original filename.extension
        echo -e "$newname: $file" > "$newname.txt"
    fi

    ((counter++))
done
