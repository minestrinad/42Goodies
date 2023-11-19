#!/bin/bash

# funtction that recursively norm all subdirectories with a Makefile
norm_dir( ){
    local current_repo="$1"
    local exclude_directories=("${@:2}")

    for sub_repo in "$current_repo"*/; do
        exclude=false
        for exclude_dir in "${exclude_directories[@]}"; do
            if [[ "$sub_repo" == "$exclude_dir"* ]]; then
                exclude=true
                break
            fi
        done
        if [ "$exclude" == true ]; then
            continue
        fi
        if [ -d "$sub_repo" ]; then
            echo "Norminette $sub_repo..."
            (norminette -R CheckForbiddenSourceHeader "$sub_repo"*.c "$sub_repo"*.h)
            norm_dir "$sub_repo" "${exclude_directories[@]}"
        fi
    done
}

# Check if the path argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_directory>"
    exit 1
fi

path="$1"

if [[ ! "$path" == /* ]]; then
    path="/$path"
fi

# Navigate to the specified directory
cd "$HOME$path" || exit

if [ "$2" == "-exclude" ]; then
    exclude_directories=("${@:3}")
else
    exclude_directories=()
fi

# Check if the directory exists
if [ ! -d "$HOME$path" ]; then
    echo -e "\e[31mError: Directory not found.\e[0m"
    exit 1
fi

# Check if the directory is empty
if [ -z "$(ls -A $HOME$path)" ]; then
    echo -e "\e[31mError: Directory is empty.\e[0m"
    exit 1
fi

# complete the exclude path
exclude_paths=()
for dir in "${exclude_directories[@]}"; do
    exclude_paths+=("$HOME$path$dir")
done

# Call the function to norm all subdirectories with a Makefile

norm_dir "$HOME$path" "${exclude_paths[@]}"

echo -e "\e[32mNorminette completed.\e[0m"