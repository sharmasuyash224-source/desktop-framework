#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

echo
echo "========== Desktop Status =========="
echo

printf "%-15s %-12s\n" "Module" "Status"
printf "%-15s %-12s\n" "------" "------"

for module in $(desktop::list_modules); do

    STATUS="$(desktop::module_status "$module" 2>/dev/null || echo unknown)"

    printf "%-15s %-12s\n" "$module" "$STATUS"

done

echo
