#!/usr/bin/env bash

# Hide if bluetooth is powered off
if ! bluetoothctl show | grep -q "Powered: yes"; then
    printf '{"text":"","class":"hidden"}\n'
    exit 0
fi

device=$(bluetoothctl devices Connected | head -n1)

if [[ -n "$device" ]]; then
    name="${device#* }"
    name="${name#* }"
    printf '{"text":"󰂱 %s","tooltip":"Connected: %s"}\n' "$name" "$name"
else
    printf '{"text":"","tooltip":"Bluetooth On"}\n'
fi
