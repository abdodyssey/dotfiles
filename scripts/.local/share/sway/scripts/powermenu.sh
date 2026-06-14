#!/bin/zsh
# Simple power menu using dmenu-style

choice=$(printf "🔒 Lock\n🚪 Logout\n💤 Suspend\n❄️  Hibernate\n🔴 Shutdown\n🔄 Reboot" | \
    dmenu -p "⚡ Power" -fn "JetBrainsMono Nerd Font-16" -nb "#1e1e2e" -nf "#cdd6f4" -sb "#cba6f7" -sf "#1e1e2e")

case "$choice" in
    "🔒 Lock") swaylock -f ;;
    "🚪 Logout") swaymsg exit ;;
    "💤 Suspend") systemctl suspend ;;
    "❄️  Hibernate") systemctl hibernate ;;
    "🔴 Shutdown") systemctl poweroff ;;
    "🔄 Reboot") systemctl reboot ;;
esac
