#!/bin/zsh
# Toggle airplane mode (WiFi + Bluetooth)

WIFI_STATUS=$(nmcli radio wifi)
BT_STATUS=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [[ "$WIFI_STATUS" == "enabled" || "$BT_STATUS" == "yes" ]]; then
    # Turn OFF
    nmcli radio wifi off
    bluetoothctl power off
    /bin/notify-send -u normal "✈️  Airplane Mode" "WiFi & Bluetooth disabled"
else
    # Turn ON
    nmcli radio wifi on
    bluetoothctl power on
    /bin/notify-send -u normal "📡 Airplane Mode Off" "WiFi & Bluetooth enabled"
fi
