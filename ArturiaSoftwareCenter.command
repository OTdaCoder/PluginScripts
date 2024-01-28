#!/bin/bash

# Check for admin rights
if [ "$(whoami)" != "root" ]; then
    echo "This script requires administrator privileges. Please enter your password."
    sudo "$0" "$@"
    exit $?
fi

# Define the file paths
presets_path="/Library/Arturia/Arturia Software Center"
remove_app="/Applications/Arturia/Arturia Software Center.app"
plist_file="${HOME}/Library/Preferences/com.Arturia.ArturiaSoftwareCenter.plist"

# Define the plugin name (excluding file extension)
plugin_name="Arturia Software Center"

# Remove the presets directory
if [ -d "$presets_path" ]; then
    echo "Removing presets directory: $presets_path"
    rm -rf "$presets_path"
else
    echo "Presets directory $presets_path not found. Skipping..."
fi

# Remove Application
if [ -d "$remove_app" ]; then
    echo "Removing application: $plugin_name"
    rm -rf "$remove_app"
else
    echo "Presets directory $remove_app not found. Skipping..."
fi

# Remove the plist file
if [ -f "$plist_file" ]; then
    echo "Removing plist file: $plist_file"
    rm -rf "$plist_file"
else
    echo "Plist file $plist_file not found. Skipping..."
fi

echo "Uninstallation complete for $plugin_name."