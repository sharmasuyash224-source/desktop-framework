#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-status}"

case "$ACTION" in

start)

    log::step "Starting desktop session"

    hyprpaper -c "$HOME/.config/hypr/hyprpaper.conf" >/dev/null 2>&1 &

    sleep 1

    desktop wallpaper random >/dev/null 2>&1

    waybar >/dev/null 2>&1 &

    swaync >/dev/null 2>&1 &

    playerctld daemon >/dev/null 2>&1 &

    log::success "Desktop session started."
    ;;

stop)

    log::step "Stopping desktop session"

    pkill waybar 2>/dev/null || true
    pkill swaync 2>/dev/null || true
    pkill hyprpaper 2>/dev/null || true
    pkill playerctld 2>/dev/null || true

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

    for p in hyprpaper waybar swaync playerctld; do
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
    ;;

esac
