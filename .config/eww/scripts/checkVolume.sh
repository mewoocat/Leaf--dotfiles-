#!/bin/bash

# From: https://stackoverflow.com/questions/34936783/watch-for-volume-changes-in-alsa-pulseaudio

#pactl subscribe | grep --line-buffered "sink" | xargs -n1 ./volume.sh
pactl subscribe | grep --line-buffered "sink" | while read -r UNUSED_LINE; do /home/ghost/.config/eww/scripts/volume.sh; done
