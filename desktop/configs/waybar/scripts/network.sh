#!/usr/bin/env bash

wifi=$(nmcli -t -f ACTIVE,SSID,SIGNAL dev wifi | grep '^yes')

if [[ -n "$wifi" ]]; then
    IFS=':' read -r _ ssid signal <<< "$wifi"

    printf '{"text":"󰖩 %s%%","tooltip":"SSID: %s | Signal: %s%%"}\n' \
        "$signal" "$ssid" "$signal"
    exit 0
fi

eth=$(nmcli -t -f DEVICE,STATE,TYPE device | awk -F: '$2=="connected" && $3=="ethernet"{print $1}')

if [[ -n "$eth" ]]; then
    ip=$(ip -4 addr show "$eth" | awk '/inet /{print $2}' | cut -d/ -f1)

    printf '{"text":"󰈀","tooltip":"Ethernet | IP: %s"}\n' "$ip"
    exit 0
fi

printf '{"text":"󰖪","class":"disconnected","tooltip":"No Network"}\n'