#!/bin/bash

set -e

# funtction that recursively clean all subdirectories with a Makefile
clean_dir( ) {
    local current_repo="$1"

    for sub_repo in "$current_repo"*/; do
        if [ -d "$sub_repo" ]; then
            if [ -e "$sub_repo/Makefile" ]; then
                echo "Cleaning $sub_repo..."
                (cd "$sub_repo" && make fclean)
            fi
            clean_dir "$sub_repo"
        fi
    done
}

# Check if the path argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_directory>"
    exit 1
fi

# Navigate to the specified directory
cd "$HOME$1" || exit

# Check if the directory exists
if [ ! -d "$HOME$1" ]; then
    echo -e "\e[31mError: Directory not found.\e[0m"
    exit 1
fi

# Check if the directory is empty
if [ -z "$(ls -A $HOME$1)" ]; then
    echo -e "\e[31mError: Directory is empty.\e[0m"
    exit 1
fi

# Call the function to clean all subdirectories with a Makefile
clean_dir "$HOME$1"

# Clean each executable file find from the specified directory
find "$HOME$1" -type f -name "*.out" -exec rm -f '{}' +

# Clean each object file find from the specified directory
find "$HOME$1" -type f -name "*.o" -exec rm -f '{}' +

# Clean each temporary file find from the specified directory
find "$HOME$1" -type f -name "*~" -exec rm -f '{}' +

# Clean each hidden file find from the specified directory
find "$HOME$1" -type d \( -name ".git" -o -name "." -o -name ".." \) -prune -o -name ".*" -exec rm -rf '{}' +

echo -e "\e[32mRepository cleaned.\e[0m"
