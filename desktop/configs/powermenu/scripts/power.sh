#!/usr/bin/env bash

chosen=$(
printf "  Shutdown\n  Reboot\n  Suspend\n  Lock\n  Logout" |
rofi \
-dmenu \
-i \
-no-custom \
-p "Power" \
-config ~/.config/powermenu/config.rasi
)

case "$chosen" in
    "  Shutdown")
        systemctl poweroff
        ;;
    "  Reboot")
        systemctl reboot
        ;;
    "  Suspend")
        systemctl suspend
        ;;
    "  Lock")
        hyprlock
        ;;
    "  Logout")
        hyprctl dispatch exit
        ;;
esac
