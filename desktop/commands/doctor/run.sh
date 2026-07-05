#!/usr/bin/env bash

source "$HOME/.config/desktop/core/framework.sh"

echo
echo "========== Desktop Doctor =========="
echo

echo "Framework"

desktop::require_directory "$HOME/.config/desktop"
desktop::require_directory "$HOME/.config/desktop/modules"
desktop::require_directory "$HOME/.config/desktop/pipelines"

echo
echo "Modules"

for module in $(desktop::list_modules); do

    echo
    echo "[$module]"

    desktop::module_doctor "$module" || true

done

echo
log::success "Desktop Doctor completed."
