The 42Goodies repository is a curated collection of essential scripts tailored for developers navigating the challenges of the 42 School (École 42) curriculum and beyond. These scripts aim to streamline common tasks, enforce coding standards, and enhance the overall development experience. Whether you're polishing your projects, preparing for evaluations, or simply seeking efficiency in your coding workflow, 42Goodies has got you covered.

Key Scripts:
- [git-acp.sh](#git-acp-script)
- [clean-repo.sh](#clean-repository-script-clean-reposh)

clean-repo.sh:
        An all-in-one script to thoroughly clean your repository. It removes compiled binaries, object files, and other temporary files, ensuring a pristine working directory.

# Git ACP Script *git-acp.sh*

This script automates the process of adding, committing, and pushing changes for one or multiple Git repositories within a specified directory. The script is designed to enhance efficiency in managing multiple repositories simultaneously.

### Usage:

1. **Requirements:**
   - Bash shell environment
   - Git installed

2. **Script Parameters:**
   - `<path_to_directory>`: The path to the directory containing Git repositories.

3. **Running the Script:**
   ```bash
   ./git-acp.sh <path_to_directory>
   ```

### Script Features:

- **Prompt for Commit Message:**
  - The script prompts the user for a commit message for each repository. If no message is provided, it defaults to a timestamped commit.

- **Direct Push from Directory:**
  - If the specified directory itself is a Git repository, the script will add, commit, and push changes directly from that directory.

- **Iterative Processing:**
  - For each subdirectory within the specified directory that contains a Git repository, the script performs the following actions:
    - Adds all changes.
    - Prompts for a commit message.
    - Commits changes with a default or user-specified message.
    - Pushes changes to the remote repository.

- **Visual Feedback:**
  - Provides colored console output for better visibility:
    - Errors are displayed in red.
    - Processing messages are displayed in green.

### Example Usage:

1. **Run the Script:**
   ```bash
   ./git-acp.sh ~/Desktop/path/to/repos
   ```
   Adjust the path accordingly.

2. **Follow Prompts:**
   - The script will guide you through providing commit messages for each repository or accepting timestamped default messages.

3. **Review Output:**
   - The script displays processing messages for each repository, making it easy to track the progress.

### Notes:

- Ensure the script has executable permissions: `chmod +x git-acp.sh`.
- The script uses the default branch for pushing. Modify the `git push` command if your branch differs.

**Enjoy automating your Git workflow with the Git ACP script!**

# Clean Repository Script *(clean-repo.sh)*

This Bash script is designed to provide a comprehensive cleaning solution for repositories, particularly those following the 42 norm rules. It recursively cleans all subdirectories containing a Makefile and removes executable files, object files, temporary files, and hidden files (excluding `.git`, `.`, and `..`) within the specified directory.

### Usage:

```bash
./clean-repo.sh <path_to_directory>
```

### Script Features:

- **Recursive Cleaning:**
  - The script recursively traverses all subdirectories within the specified directory, identifying those containing a Makefile. It then executes `make fclean` within each identified repository, adhering to the 42 norm rules.

- **File Cleanup:**
  - Removes the following files from the specified directory:
    - Executable files with the extension `.out`.
    - Object files with the extension `.o`.
    - Temporary files with names ending in `~`.
    - Hidden files (excluding `.git`, `.`, and `..`).

- **Caution :warning::**
  - The script uses `rm -f` to forcefully remove files. Exercise caution while using this script, and ensure you have a backup if needed.

### Notes:

- **42 Norm Rules:**
  - This script aligns with the 42 norm rules, cleaning executable and object files, temporary files, and hidden files within the specified directory.

- **Makefile Cleaning:**
  - The script prioritizes cleaning subdirectories with a Makefile, executing `make fclean` to ensure thorough repository cleanup.

### Usage Example:

```bash
./clean-repo.sh ~/Desktop/my_project
```

### Caution Alert:warning::

- **Use with Caution:warning::**
  - Be mindful when running this script, especially the `rm -f` commands, as they forcefully remove files without confirmation.

**Note:** The script follows the 42 norm rules, and while it provides a comprehensive cleaning solution, it may not suit all project structures. Adjust the script as needed for specific requirements.

**Enjoy maintaining a clean repository with the Clean Repository Script!**

Usage:
Clone the 42Goodies repository and explore the scripts based on your needs. Each script is designed to be user-friendly with clear instructions in the comments. Run the scripts on your project directory to automate routine tasks and maintain compliance with 42 coding standards.

Contributing:
Contributions are encouraged! If you have scripts that align with the 42 development environment or address common challenges faced by 42 students, feel free to submit a pull request.

License:
This repository is open-source, fostering collaboration and sharing within the 42 community. Use, modify, and share these scripts to enhance the development experience for all 42 students.
