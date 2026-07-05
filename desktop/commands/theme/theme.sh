#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-generate}"

case "$ACTION" in

generate)

    "$THEME_ENGINE_DIR/generate-theme.sh"

    ;;

help)

    echo

    echo "desktop theme generate"

    ;;

*)

    log::error "Unknown theme command"

    exit 1

    ;;
esac
