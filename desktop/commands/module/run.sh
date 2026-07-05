#!/usr/bin/env bash

set -euo pipefail

source "$HOME/.config/desktop/core/framework.sh"
source "$HOME/.config/desktop/core/module.sh"

ACTION="${1:-list}"
MODULE="${2:-}"

case "$ACTION" in

    list)
        desktop::module_list
        ;;

    info)
        [[ -n "$MODULE" ]] || {
            echo "Usage: desktop module info <module>"
            exit 1
        }
        desktop::module_info "$MODULE"
        ;;

    doctor)
        [[ -n "$MODULE" ]] || {
            echo "Usage: desktop module doctor <module>"
            exit 1
        }
        exec "$HOME/.config/desktop/modules/$MODULE/doctor.sh"
        ;;

    status)
        [[ -n "$MODULE" ]] || {
            echo "Usage: desktop module status <module>"
            exit 1
        }
        exec "$HOME/.config/desktop/modules/$MODULE/status.sh"
        ;;

    reload)
        [[ -n "$MODULE" ]] || {
            echo "Usage: desktop module reload <module>"
            exit 1
        }
        exec "$HOME/.config/desktop/modules/$MODULE/reload.sh"
        ;;

    *)
        echo "Usage:"
        echo "  desktop module list"
        echo "  desktop module info <module>"
        echo "  desktop module doctor <module>"
        echo "  desktop module status <module>"
        echo "  desktop module reload <module>"
        exit 1
        ;;
esac
