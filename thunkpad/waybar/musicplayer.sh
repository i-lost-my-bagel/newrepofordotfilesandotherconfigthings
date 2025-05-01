#!/usr/bin/env bash

if test -f /tmp/.musicplayer; then
		CURRENT_PLAYER=$(cat /tmp/.musicplayer)
else
		echo "spotify" > /tmp/.musicplayer
		CURRENT_PLAYER=$(cat /tmp/.musicplayer)
		exit
fi



case $1 in
		play-pause)
				playerctl  -p $CURRENT_PLAYER play-pause
				pkill -SIGRTMIN+9 waybar
				exit
				;;
		previous)
				playerctl  -p $CURRENT_PLAYER previous
				pkill -SIGRTMIN+9 waybar
				exit
				;;
		next)
				playerctl  -p $CURRENT_PLAYER next
				pkill -SIGRTMIN+9 waybar
				exit
				;;
		state)
				if [ "$(playerctl  -p $CURRENT_PLAYER status)" == "Playing" ]; then
						echo "󰏤"
						exit
				else
						echo "󰐊"
						exit
				fi
				;;
		pick-player)
				CHOICE=$(playerctl  -l | rofi -config ~/.config/rofi/custom.rasi -dmenu -no-fixed-num-lines )
				echo $CHOICE > /tmp/.musicplayer
				pkill -SIGRTMIN+9 waybar
				exit
				;;
		get-track)
				playerctl  -p $CURRENT_PLAYER metadata title 2> /dev/null 1> /dev/null
				if [ $? == 1 ]; then
						echo "no media"
				else
						SONG="$(playerctl  -p $CURRENT_PLAYER metadata xesam:title)"
						ARTIST="$(playerctl  -p $CURRENT_PLAYER metadata xesam:artist)"

						echo "$SONG - $ARTIST"
				fi
				;;
esac


