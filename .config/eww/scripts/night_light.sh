#!/bin/bash

if [[ $1 == "on" ]]; then
    eww update night_light=true
    killall -9 gammastep
    gammastep -O 2000
fi

if [[ $1 == "off" ]]; then
    eww update night_light=false
    killall -9 gammastep
fi
