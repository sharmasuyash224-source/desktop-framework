#!/usr/bin/env bash

desktop::help() {

    echo
    echo "Desktop Framework $DESKTOP_VERSION"
    echo

    for category in framework system theme service
    do
        printed=false

        for manifest in "$HOME/.config/desktop/commands"/*/manifest.sh
        do
            unset COMMAND_NAME
            unset COMMAND_DESCRIPTION
            unset COMMAND_CATEGORY
            unset COMMAND_ENABLED

            source "$manifest"

            [[ "$COMMAND_CATEGORY" != "$category" ]] && continue
            [[ "$COMMAND_ENABLED" != true ]] && continue

            if ! $printed
            then
                echo "${category^^}"
                printed=true
            fi

            printf "  %-14s %s\n" \
                "$COMMAND_NAME" \
                "$COMMAND_DESCRIPTION"
        done

        $printed && echo
    done
}