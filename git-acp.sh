#!/bin/bash

set -e

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

# Check if the directory contains Git repositories
# if so push directly from the directory
if [ -d "$HOME$path/.git" ]; then
    # Prompt the user for a commit message
    read -p "Enter a commit message for $directory (press Enter to use timestamp): " commit_message

    # Use timestamp if no commit message is provided
    if [ -z "$commit_message" ]; then
        timestamp=$(date +"%Y-%m-%d %T")
        commit_message="Auto commit at $timestamp"
    fi

    # Add all changes
    git add .

    # Commit changes with a default commit message
    git commit -m "$commit_message"

    # Push changes to the remote repository
    git push        # Modify the branch name as needed

    echo -e "\e[32mGit ACP script completed.\e[0m"
    exit 1
fi

# Iterate through each subdirectory (Git repository) in the specified directory
for repo in */; do
    if [ -d "$repo/.git" ]; then
        echo -e "\e[32mProcessing repository: $repo\e[0m"

        # Enter the Git repository
        cd "$repo" || exit

        # Prompt the user for a commit message
        read -p "Enter a commit message for $directory (press Enter to use timestamp): " commit_message

        # Use timestamp if no commit message is provided
        if [ -z "$commit_message" ]; then
            timestamp=$(date +"%Y-%m-%d %T")
            commit_message="Auto commit at $timestamp"
        fi

        # Add all changes
        git add .

        # Commit changes with a default commit message
        git commit -m "$commit_message"

        # Push changes to the remote repository
        git push        # Modify the branch name as needed

        # Move back to the parent directory
        cd ..

        echo "---------------------------------------------"
    fi
done

echo -e "\e[32mGit ACP script completed.\e[0m"


