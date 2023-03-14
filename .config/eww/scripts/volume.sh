#!/bin/bash


level=$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%' | head -1)

if (($level))
then
    if (($level > 75)); then
        icon=$(echo -e "")
    elif (($level > 50)); then
        icon=$(echo -e "")
    elif (($level > 25)); then
        icon=$(echo -e "")
    else
        icon=$(echo -e "")
    fi
    bg=$(echo -e "")
else
    icon=$(echo -e "")
    bg=$(echo -e "")
fi

#echo -n $level
echo "{\"icon\": \"${icon}\", \"bg\": \"${bg}\"}"
