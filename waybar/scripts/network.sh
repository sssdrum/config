#!/bin/zsh
# Try to get interface name by skipping headers and separators
interface=$(iwctl station list | awk 'NR==5{print $2}')
# Default output if interface is not found
if [ -z "$interface" ]; then
    echo '{"text": "No device ⚠", "tooltip": "No wireless device found"}'
    exit
fi
# Check connection status
status=$(iwctl station "$interface" show)
if echo "$status" | grep -q "Connected network"; then
    essid=$(echo "$status" | awk -F 'Connected network' '/Connected network/ {print $2}' | xargs)
    ipaddr=$(echo "$status" | awk -F 'IPv4 address' '/IPv4 address/ {print $2}' | xargs)
    rssi=$(echo "$status" | awk -F 'RSSI' '/RSSI/ {print $2}' | head -n 1 | awk '{print $1}')
    signal=$(( 2 * (rssi + 100) ))
    if [ "$signal" -gt 100 ]; then signal=100; fi
    if [ "$signal" -lt 0 ]; then signal=0; fi
    
    # Print JSON for Waybar with cleaner text output - Fixed quotes
    echo "{\"text\": \"$essid ${signal}%\", \"tooltip\": \"IP: $ipaddr\", \"class\": \"connected\", \"percentage\": $signal}"
else
    echo '{"text": "⚠ Disconnected", "tooltip": "Not connected", "class": "disconnected", "percentage": 0}'
fi
