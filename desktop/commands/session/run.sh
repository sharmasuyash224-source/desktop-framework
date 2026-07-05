#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-status}"

case "$ACTION" in

start)

    log::step "Starting desktop session"

    desktop::module_start hyprpaper
    desktop::module_start hypridle
    desktop::module_start waybar
    desktop::module_start swaync

    STATE="$HOME/.cache/hypr/last_wallpaper"

    if [[ -f "$STATE" ]]; then
        WALLPAPER="$(cat "$STATE")"
        ~/.config/desktop/pipelines/wallpaper/steps/02-apply.sh
    else
        desktop wallpaper random >/dev/null 2>&1
    fi

    log::success "Desktop session started."
    ;;

stop)

    log::step "Stopping desktop session"

    desktop::module_stop waybar
    desktop::module_stop swaync
    desktop::module_stop hypridle
    desktop::module_stop hyprpaper

    log::success "Desktop session stopped."
    ;;

restart)

    "$0" stop
    sleep 1
    "$0" start
    ;;

status)

    echo
    printf "%-15s %-10s\n" "Service" "Status"
    printf "%-15s %-10s\n" "-------" "------"

    for p in hyprpaper hypridle waybar swaync playerctld; do
        if pgrep -x "$p" >/dev/null; then
            printf "%-15s %-10s\n" "$p" "running"
        else
            printf "%-15s %-10s\n" "$p" "stopped"
        fi
    done

    echo
    ;;

*)

    echo "Usage:"
    echo "  desktop session start"
    echo "  desktop session stop"
    echo "  desktop session restart"
    echo "  desktop session status"
    exit 1
    ;;

esac
