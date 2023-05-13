#!/bin/bash


level=$(amixer get Capture | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%' | head -1)

if (($level))
then
    if (($level > 0)); then
        icon=$(echo -e "")
    fi
else
    icon=$(echo -e "")
fi

#echo -n $level
echo "{\"icon\": \"${icon}\", \"level\": \"${level}\"}"

