#!/bin/bash

# Check for admin rights
if [ "$(whoami)" != "root" ]; then
    echo "This script requires administrator privileges. Please enter your password."
    sudo "$0" "$@"
    exit $?
fi

# Define file paths
components_path="/Library/Audio/Plug-Ins/Components"
vst_path="/Library/Audio/Plug-Ins/VST"
vst3_path="/Library/Audio/Plug-Ins/VST3"
aax_path="/Library/Application Support/Avid/Audio/Plug-Ins"
presets_path="/Library/Application Support/Wavesfactory/Cassette Transport"

# Define the plugin name (excluding file extension)
plugin_name="Warmy EP1A V2"

# Function to uninstall from a specific path
uninstall_from_path() {
    path=$1
    if [ -d "$path" ]; then
        echo "Uninstalling from $path..."
        rm -rf "$path/$plugin_name"*
    else
        echo "Path $path not found. Skipping..."
    fi
}

# Uninstall from each specified path
uninstall_from_path "$components_path"
uninstall_from_path "$vst_path"
uninstall_from_path "$vst3_path"
uninstall_from_path "$aax_path"

echo "Uninstallation complete for $plugin_name."
