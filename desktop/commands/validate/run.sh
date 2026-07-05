#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

PASS=0
FAIL=0

check_dir() {
    if [[ -d "$1" ]]; then
        log::success "$2"
        ((++PASS))
    else
        log::error "$2"
        ((++FAIL))
    fi
}

check_file() {
    if [[ -f "$1" ]]; then
        log::success "$2"
        ((++PASS))
    else
        log::error "$2"
        ((++FAIL))
    fi
}

check_cmd() {
    if command -v "$1" >/dev/null 2>&1; then
        log::success "$1"
        ((++PASS))
    else
        log::error "$1"
        ((++FAIL))
    fi
}

echo
log::step "Desktop Framework Validation"
echo

echo "== Core =="

check_dir "$HOME/.config/desktop" "Desktop root"
check_dir "$HOME/.config/desktop/core" "Core"
check_dir "$HOME/.config/desktop/modules" "Modules"
check_dir "$HOME/.config/desktop/commands" "Commands"
check_dir "$HOME/.config/desktop/pipelines" "Pipelines"

echo
echo "== Theme Engine =="

check_dir "$HOME/.config/theme-engine" "Theme Engine"
check_dir "$HOME/.config/theme-engine/generators" "Generators"

echo
echo "== External Dependencies =="

for cmd in \
    hyprpaper \
    hyprlock \
    waybar \
    wallust \
    rofi \
    swaync \
    playerctl \
    playerctld \
    jq
do
    check_cmd "$cmd"
done

echo
echo "== Modules =="

for module in $(desktop::list_modules); do

    MOD="$HOME/.config/desktop/modules/$module"

    check_file "$MOD/manifest.sh" "$module manifest"
    check_file "$MOD/start.sh" "$module start"
    check_file "$MOD/stop.sh" "$module stop"
    desktop::module_load "$module"

if [[ "${MODULE_RELOADABLE:-true}" == true ]]; then
    check_file "$MOD/reload.sh" "$module reload"
fi
    check_file "$MOD/status.sh" "$module status"
    check_file "$MOD/doctor.sh" "$module doctor"

done

echo
echo "================================"

echo "Passed : $PASS"
echo "Failed : $FAIL"

echo

if (( FAIL == 0 )); then
    log::success "Validation passed."
else
    log::error "Validation failed."
    exit 1
fi
