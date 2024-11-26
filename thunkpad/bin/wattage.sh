#!/bin/bash
if [ $(cat /sys/class/power_supply/BAT0/power_now) == 0 ]; then
	awk '{print $1*1e-6 " W"}' /sys/class/power_supply/BAT1/power_now
else
	awk '{print $1*1e-6 " W"}' /sys/class/power_supply/BAT0/power_now
fi
