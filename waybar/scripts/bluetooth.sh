#!/bin/bash

# Get connected devices
connected_devices=$(bluetoothctl devices Connected)
if [ -z "$connected_devices" ]; then
    echo '{"text": " 0", "tooltip": "No devices connected"}'
    exit
fi

num_connected=$(echo "$connected_devices" | wc -l)
tooltip=""
tooltip="Connected devices:\n"
while IFS= read -r device; do
    # Get device name
    mac=$(echo "$device" | awk '{print $2}')
    name=$(bluetoothctl info "$mac" | grep "Name" | awk -F ':' '/:/ {print $2}' | xargs)
    if [ -z "$name" ]; then
        name="Unknown device"
    fi
    tooltip+="• $name\n"
done <<<"$connected_devices"
tooltip="${tooltip::-2}" # Remove trailing newline

# Output JSON
echo '{"text": " '"$num_connected"'", "tooltip": "'"$tooltip"'"}'
