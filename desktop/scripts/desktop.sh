#!/usr/bin/env bash

set -euo pipefail

source "$HOME/.config/desktop/manifest.sh"

case "${1:-}" in

    theme)
        "$THEME_ENGINE_DIR/generate-theme.sh"
        ;;

    reload)
        "$CONFIG_DIR/scripts/reload.sh"
        ;;

    wallpaper)
        "$CONFIG_DIR/scripts/wallpaper.sh"
        ;;

    session)
        "$CONFIG_DIR/scripts/session.sh"
        ;;

    power)
        "$POWERMENU_DIR/scripts/power.sh"
        ;;

    lock)
        exec "$HOME/.config/desktop/modules/hyprlock/lock.sh"
        ;;

    *)
        echo
        echo "Desktop Framework"
        echo
        echo "Commands:"
        echo "  theme"
        echo "  reload"
        echo "  wallpaper"
        echo "  session"
        echo "  power"
        echo "  lock"
        echo
        ;;
esac
