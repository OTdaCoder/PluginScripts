#!/bin/bash

# Determine the current username
current_user=$(whoami)

# Define the file paths
components_path="/Library/Audio/Plug-Ins/Components"
vst_path="/Library/Audio/Plug-Ins/VST"
vst3_path="/Library/Audio/Plug-Ins/VST3"
clap_path="/Library/Audio/Plug-Ins/CLAP"
aax_path="/Library/Application Support/Avid/Audio/Plug-Ins"

# Additional user directories
user_documents_path="/Users/$current_user/Documents/FabFilter"
user_presets_path="/Users/$current_user/Library/Audio/Presets/FabFilter"
user_support_path="/Users/$current_user/Library/Application Support/FabFilter"

# Preferences directory
user_preferences_path="/Users/$current_user/Library/Preferences"

# Define the list of files to remove (excluding extension)
files_to_remove=(
    "FabFilter Micro"
    "FabFilter One"
    "FabFilter Pro-C 2"
    "FabFilter Pro-DS"
    "FabFilter Pro-G"
    "FabFilter Pro-L 2"
    "FabFilter Pro-MB"
    "FabFilter Pro-Q 3"
    "FabFilter Pro-R"
    "FabFilter Saturn 2"
    "FabFilter Simplon"
    "FabFilter Timeless 3"
    "FabFilter Twin 2"
    "FabFilter Twin 3"
    "FabFilter Volcano 3"
)

# Function to remove specific files from a directory
remove_files_from_directory() {
    local path=$1

    if [ -d "$path" ]; then
        echo "Removing specific files from: $path"

        # Use sudo to enable admin privileges
        for file in "${files_to_remove[@]}"; do
            sudo rm -f "$path/$file"*
            echo "Removed: $path/$file"
        done

        echo "File removal complete for: $path"
    else
        echo "Directory not found: $path"
    fi
}

# Function to remove files containing "fabfilter" in the Preferences directory
remove_fabfilter_preferences() {
    local path=$1

    if [ -d "$path" ]; then
        echo "Searching for files with 'fabfilter' in: $path"

        # Use sudo to enable admin privileges
        sudo find "$path" -type f -name "*fabfilter*" -exec rm -f {} \;

        echo "File removal complete for: $path"
    else
        echo "Directory not found: $path"
    fi
}

# Remove specific files from each specified directory
remove_files_from_directory "$components_path"
remove_files_from_directory "$vst_path"
remove_files_from_directory "$vst3_path"
remove_files_from_directory "$clap_path"
remove_files_from_directory "$aax_path"

# Remove files from additional user directories
remove_files_from_directory "$user_documents_path"
remove_files_from_directory "$user_presets_path"
remove_files_from_directory "$user_support_path"

# Remove files containing "fabfilter" in Preferences directory
remove_fabfilter_preferences "$user_preferences_path"

echo "All specified files have been removed from the directories."

exit 0
