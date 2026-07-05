#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-help}"

case "$ACTION" in

next|random)

    "$HOME/.config/hypr/scripts/change-wallpaper.sh"
    ;;

current)

    cat "$HOME/.cache/hypr/last_wallpaper"
    ;;

help|"")

    echo

    echo "Wallpaper Commands"

    echo

    echo "desktop wallpaper next"

    echo "desktop wallpaper random"

    echo "desktop wallpaper current"

    ;;

*)

    log::error "Unknown wallpaper command: $ACTION"

    exit 1

    ;;
esac
