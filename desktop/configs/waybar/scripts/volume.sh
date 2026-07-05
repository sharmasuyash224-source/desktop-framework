#!/usr/bin/env bash

DEVICE="@DEFAULT_AUDIO_SINK@"

volume_info=$(wpctl get-volume "$DEVICE")

if [[ -z "$volume_info" ]]; then
    printf '{"text":"󰝟","class":"muted","tooltip":"No audio device"}\n'
    exit 0
fi

muted=false
[[ "$volume_info" == *MUTED* ]] && muted=true

volume=$(awk '{printf "%d", $2 * 100}' <<< "$volume_info")

device_name=$(
    wpctl inspect "$DEVICE" 2>/dev/null |
    awk -F'"' '/node.description/ {print $2; exit}'
)

[[ -z "$device_name" ]] && device_name="Default Output"

if $muted; then
    icon="󰝟"
else
    if (( volume == 0 )); then
        icon="󰕿"
    elif (( volume < 35 )); then
        icon="󰖀"
    elif (( volume < 70 )); then
        icon="󰕾"
    else
        icon="󰕾"
    fi
fi

tooltip="$device_name\nVolume: ${volume}%"

if $muted; then
    tooltip="$tooltip\nMuted"
fi

printf '{"text":"%s %d%%","tooltip":"%s","class":"%s"}\n' \
    "$icon" \
    "$volume" \
    "$tooltip" \
    "$( $muted && echo muted || echo normal )"
