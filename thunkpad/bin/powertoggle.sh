#!/bin/bash

current=$(powerprofilesctl get)

if [ $current = 'balanced' ]; then
	powerprofilesctl set power-saver
fi

if [ $current = 'power-saver' ]; then
	powerprofilesctl set balanced
fi

pkill -SIGRTMIN+8 waybar
