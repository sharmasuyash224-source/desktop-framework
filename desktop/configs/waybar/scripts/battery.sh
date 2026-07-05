#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"

capacity=$(<"$BAT/capacity")
status=$(<"$BAT/status")

# Choose icon
if [[ "$status" == "Charging" ]]; then
    icon="󰂄"
    class="charging"
else
    if (( capacity <= 10 )); then
        icon="󰁺"
        class="critical"
    elif (( capacity <= 20 )); then
        icon="󰁻"
        class="critical"
    elif (( capacity <= 30 )); then
        icon="󰁼"
        class="warning"
    elif (( capacity <= 40 )); then
        icon="󰁽"
        class="warning"
    elif (( capacity <= 50 )); then
        icon="󰁾"
        class="normal"
    elif (( capacity <= 60 )); then
        icon="󰁿"
        class="normal"
    elif (( capacity <= 70 )); then
        icon="󰂀"
        class="normal"
    elif (( capacity <= 80 )); then
        icon="󰂁"
        class="normal"
    elif (( capacity <= 90 )); then
        icon="󰂂"
        class="normal"
    else
        icon="󰁹"
        class="normal"
    fi
fi

tooltip="Battery: ${capacity}%\nStatus: ${status}"

# Remaining time (if available)
if [[ -f "$BAT/power_now" && -f "$BAT/energy_now" && "$status" == "Discharging" ]]; then
    power=$(<"$BAT/power_now")
    energy=$(<"$BAT/energy_now")

    if (( power > 0 )); then
        minutes=$(( energy * 60 / power ))
        hours=$(( minutes / 60 ))
        mins=$(( minutes % 60 ))

        tooltip="${tooltip}\nRemaining: ${hours}h ${mins}m"
    fi
fi

printf '{"text":"%s %d%%","tooltip":"%s","class":"%s"}\n' \
    "$icon" \
    "$capacity" \
    "$tooltip" \
    "$class"
