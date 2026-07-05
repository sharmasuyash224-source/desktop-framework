#!/usr/bin/env bash

get_icon() {
    case "$1" in
        spotify*) echo "" ;;
        firefox*) echo "󰈹" ;;
        chromium*|google-chrome*) echo "" ;;
        vlc*) echo "󰕼" ;;
        mpv*) echo "󰐹" ;;
        *) echo "󰎆" ;;
    esac
}

player=$(playerctl -l 2>/dev/null | head -n1)

if [[ -z "$player" ]]; then
    printf '{"text":"","class":"hidden"}\n'
    exit 0
fi

status=$(playerctl status -p "$player" 2>/dev/null)

case "$status" in
    Playing) state="" ;;
    Paused)  state="" ;;
    *) printf '{"text":"","class":"hidden"}\n'; exit 0 ;;
esac

artist=$(playerctl metadata artist -p "$player" 2>/dev/null)
title=$(playerctl metadata title -p "$player" 2>/dev/null)
album=$(playerctl metadata album -p "$player" 2>/dev/null)

icon=$(get_icon "$player")

[[ -z "$title" ]] && title="Unknown"

text="$icon  $state  $title"

[[ -n "$artist" ]] && text="$icon  $state  $title — $artist"

tooltip="$title"

[[ -n "$artist" ]] && tooltip+="\nArtist : $artist"
[[ -n "$album" ]] && tooltip+="\nAlbum : $album"
tooltip+="\nPlayer : $player"

printf '{"text":"%s","tooltip":"%s"}\n' "$text" "$tooltip"