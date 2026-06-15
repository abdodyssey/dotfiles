#!/bin/bash

choice=$(printf "󰌾 Lock\n󰍃 Logout\n⏸ Suspend\n⏾ Hibernate\n⏻ Shutdown\n↺ Reboot" | wofi \
    --dmenu \
    --prompt "Power" \
    --width 300 \
    --height 300 \
    --cache-file /dev/null \
    --style ~/.config/wofi/style.css)

case "$choice" in
    "󰌾 Lock") swaylock -f ;;
    "󰍃 Logout") swaymsg exit ;;
    "⏸ Suspend") systemctl suspend ;;
    "⏾ Hibernate") systemctl hibernate ;;
    "⏻ Shutdown") systemctl poweroff ;;
    "↺ Reboot") systemctl reboot ;;
esac
