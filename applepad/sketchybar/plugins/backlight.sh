#!/bin/sh

# The brightness_change event supplies a $INFO variable in which the current backlight brightness
# percentage is passed to the script.

if [ "$SENDER" = "brightness_change" ]; then
	BRIGHTNESS="$INFO"

	case "$BRIGHTNESS" in
		[9][0-9]|100) ICON=""
		;;
		[8][0-9]) ICON=""
		;;
		[7][0-9]) ICON=""
		;;
		[6][0-9]) ICON=""
		;;
		[5][0-9]) ICON=""
		;;
		[4][0-9]) ICON=""
		;;
		[3][0-9]) ICON=""
		;;
		[2][0-9]) ICON=""
		;;
		[1][0-9]) ICON=""
		;;
		*) ICON=""
	esac

	sketchybar --set "$NAME" icon="$ICON" label="$BRIGHTNESS%"
fi
