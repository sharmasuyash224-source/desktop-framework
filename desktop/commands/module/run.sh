#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

ACTION="${1:-help}"
MODULE="${2:-}"

case "$ACTION" in

list)

    desktop::list_modules
    ;;

info)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module info <module>"
        exit 1
    }

    desktop::module_info "$MODULE"
    ;;

status)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module status <module>"
        exit 1
    }

    desktop::module_status "$MODULE"
    ;;

doctor)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module doctor <module>"
        exit 1
    }

    desktop::module_doctor "$MODULE"
    ;;

reload)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module reload <module>"
        exit 1
    }

    desktop::module_reload "$MODULE"
    ;;

start)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module start <module>"
        exit 1
    }

    desktop::module_start "$MODULE"
    ;;

stop)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module stop <module>"
        exit 1
    }

    desktop::module_stop "$MODULE"
    ;;

restart)

    [[ -n "$MODULE" ]] || {
        log::error "Usage: desktop module restart <module>"
        exit 1
    }

    desktop::module_restart "$MODULE"
    ;;

help|"")

    cat <<EOF

Desktop Module Commands

Usage:
    desktop module <command> <module>

Commands:
    list
    info <module>
    status <module>
    doctor <module>
    start <module>
    stop <module>
    restart <module>
    reload <module>

Examples:
    desktop module list
    desktop module info waybar
    desktop module status waybar
    desktop module doctor waybar
    desktop module start waybar
    desktop module stop waybar
    desktop module restart waybar
    desktop module reload waybar

EOF
    ;;

*)

    log::error "Unknown module command: $ACTION"
    exit 1
    ;;

esac
