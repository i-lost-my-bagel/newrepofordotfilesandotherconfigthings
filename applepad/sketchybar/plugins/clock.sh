#!/bin/bash

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

HOUR=$(date +%l)

if (( $HOUR >= 10 )); then
	sketchybar --set "$NAME" label.padding_right=10
else
	sketchybar --set "$NAME" label.padding_right=20
fi

sketchybar --set "$NAME" label="$(date +'%l:%M %p')"
