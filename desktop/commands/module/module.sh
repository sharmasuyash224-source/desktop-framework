#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-list}"

case "$ACTION" in

list)

    desktop::list_modules

    ;;

info)

    MODULE="${2:-}"

    [[ -z "$MODULE" ]] && {

        log::error "Specify module."

        exit 1

    }

    echo

    echo "Module : $MODULE"

    echo "Path   : $(desktop::module_path "$MODULE")"

    ;;

help)

    echo

    echo "desktop module list"

    echo "desktop module info waybar"

    ;;

*)

    log::error "Unknown module command"

    exit 1

    ;;
esac

