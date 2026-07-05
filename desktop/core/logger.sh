#!/usr/bin/env bash

log::timestamp() {
    date +"%H:%M:%S"
}

log::info() {
    printf "[%s] [INFO] %s\n" "$(log::timestamp)" "$*"
}

log::success() {
    printf "[%s] [ OK ] %s\n" "$(log::timestamp)" "$*"
}

log::warn() {
    printf "[%s] [WARN] %s\n" "$(log::timestamp)" "$*" >&2
}

log::error() {
    printf "[%s] [FAIL] %s\n" "$(log::timestamp)" "$*" >&2
}

log::step() {
    printf "\n==> %s\n" "$*"
}
