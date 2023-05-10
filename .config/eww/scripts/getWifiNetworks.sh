#!/bin/bash

GLOBIGNORE="*"
ssids=()
statuses=()
strengths=()
nmcli -g common dev wifi list > ~/.config/eww/scripts/networks.txt 

# { "number": "1", "status": "test", "color": "current" }
while read -r network
do
    # Get first column
    firstColumn="$(echo "$network" | cut -d ':' -f 1)"

    # Check if connect to network
    if [ "$firstColumn" == "*" ]; then
        status="Connected"
    else
        status="Disconnected"
    fi

    # Get ssid
    ssid="$(echo "$network" | cut -d ':' -f 8)"

    # Get strength
    strength=$(echo "$network" | cut -d ':' -f 12)
    #strength=$(expr $s)
    #echo $strength

    # Set icons
    icon_bg=""
    if (($strength > 75));
    then
        icon=""
    elif (($strength > 50));
    then
        icon=""
    elif (($strength > 25));
    then
        icon=""
    else
        icon=""
        icon=""
    fi



    exists=false
    for i in "${!ssids[@]}"
    do
        #echo "$ssid"
        #echo "${ssids[$i]}"
        if [ "$ssid" == "${ssids[$i]}" ]; then
            if [ "${status[$i]}" == "Connected" ]; then
                statuses[$i]="Connected"
            fi
            exists=true
            #echo "${ssid} exits"
        fi
    done
 
    #echo "status of $ssid: $status"

    if [[ $exists == false && $ssid != "" ]]
    then
        ssids+=("$ssid")
        statuses+=("$status")
        strengths+=("$strength")
    fi
done < ~/.config/eww/scripts/networks.txt 


echo -n '['
for i in "${!ssids[@]}"
do
    if [ $(($i+1)) != ${#ssids[@]} ]; then
        echo -n "{ \""ssid"\": \"${ssids[$i]}\", \""status"\": \"${statuses[$i]}\", \""strength"\": \"${strengths[$i]}\", \""icon"\": \"$icon\", \""icon_bg"\": \"$icon_bg\"},"
    else
        echo -n "{ \""ssid"\": \"${ssids[$i]}\", \""status"\": \"${statuses[$i]}\", \""strength"\": \"${strengths[$i]}\", \""icon"\": \"$icon\", \""icon_bg"\": \"$icon_bg\"}"

    fi
done
echo ']'




