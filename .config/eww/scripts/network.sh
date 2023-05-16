#!/usr/bin/env bash

ssid=$(iwgetid -r)

if [[ $ssid == "" ]]; then
    ssid="Disconnected"
fi

status=$(cat /proc/net/wireless | grep wlan0 | cut -d ' ' -f 6 | tr -d .)


if (($status))
then
    mode=true
    icon_bg=""
    if (($status > 75));
    then
        icon=""
    elif (($status > 50));
    then
        icon=""
    elif (($status > 25));
    then
        icon=""
    else
        icon=""
    fi
else
    mode=false
    icon=""
    icon_bg=""
fi

echo "{\"icon\": \"${icon}\", \"bg\": \"${icon_bg}\", \"ssid\": \"${ssid}\", \"status\": \"${mode}\"}"
