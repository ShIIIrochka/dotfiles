#!/bin/bash 
if ! command -v playerctl &> /dev/null; then
   	echo "playerctl is not installed."
   	exit 1
fi
get_spotify_status() {
   	playerctl -p spotify status 
} 
if pgrep -x "spotify" > /dev/null; then
   	status=$(get_spotify_status)
   	if [[ "$status" == "Playing" ]]; then
       		echo " "     
	elif [[ "$status" == "Paused" ]]; then
       		echo " "  
   	else
       		echo ""     
	fi
else     
	echo "" 
fi 
