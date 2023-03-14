#!/bin/bash

cat /proc/net/wireless | grep wlan0 | cut -d ' ' -f 6 | tr -d .
