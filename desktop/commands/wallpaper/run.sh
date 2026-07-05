#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-help}"

PIPELINE_DIR="$HOME/.config/desktop/pipelines/wallpaper"
MODULE_DIR="$HOME/.config/desktop/modules/wallpaper"

case "$ACTION" in

random|next)

    pipeline::run wallpaper

    ;;

current)

    exec "$MODULE_DIR/current.sh"
    ;;

status)

    exec "$MODULE_DIR/status.sh"
    ;;

doctor)

    exec "$MODULE_DIR/doctor.sh"
    ;;

help|"")

    echo
    echo "Wallpaper Commands"
    echo
    echo "  desktop wallpaper random"
    echo "  desktop wallpaper next"
    echo "  desktop wallpaper current"
    echo "  desktop wallpaper status"
    echo "  desktop wallpaper doctor"
    echo
    ;;

*)

    log::error "Unknown wallpaper command: $ACTION"
    exit 1
    ;;

esac
