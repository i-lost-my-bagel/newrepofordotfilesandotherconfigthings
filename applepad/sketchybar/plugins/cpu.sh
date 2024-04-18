#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

sketchybar --set "$NAME" label="$(top -l  2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }' | awk '{printf "%.f\n", int($1+0.5)}')%"

