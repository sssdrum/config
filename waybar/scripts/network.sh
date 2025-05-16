interface=$(iwctl station list | awk 'NR==5{print $2}')

if [ -z "$interface" ]; then
    echo '{"text": "No device ⚠", "tooltip": "No wireless device found"}'
    exit
fi

status=$(iwctl station "$interface" show)
if echo "$status" | grep -q "Connected network"; then
    network=$(echo "$status" | awk -F 'Connected network' '/Connected network/ {print $2}' | xargs)
    ipaddr=$(echo "$status" | awk -F 'IPv4 address' '/IPv4 address/ {print $2}' | xargs)
    echo '{"text": "   '"$network"'", "tooltip": "'"$ipaddr"'"}'
else
    echo '{"text": "󰖪   Disconnected", "tooltip": "Not connected"}'
fi
