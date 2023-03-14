#!/usr/bin/env bash

icon_dir="/home/ghost/.config/eww/images/"

<<comment
status=$(cat /proc/net/wireless | grep wlan0 | cut -d ' ' -f 6 | tr -d .)
if (($status))
then
    if (($status > 75));
    then
        icon="${icon_dir}wifi-3.svg"
    elif (($status > 50));
    then
        icon="${icon_dir}wifi-2.svg"
    elif (($status > 25));
    then
        icon="${icon_dir}wifi-1.svg"
    else
        icon="${icon_dir}wifi-0.svg"
    fi
else
    icon="${icon_dir}wifi-dc.svg"
fi
comment


# Using icons instead of images
status=$(cat /proc/net/wireless | grep wlan0 | cut -d ' ' -f 6 | tr -d .)
if (($status))
then
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
    bg=""
else
    icon=""
    bg=""
fi

#echo "${icon}"
#echo "/home/ghost/.config/eww/images/wifi-3.svg"

echo "{\"icon\": \"${icon}\", \"bg\": \"${bg}\"}"
