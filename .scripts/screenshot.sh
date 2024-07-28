#!/bin/bash

# Dir for screenshots
screenshot_dir="$HOME/screenshots"
mkdir -p "$screenshot_dir"

# screenshot's name with date and time
timestamp=$(date +'%d-%b-%Y_%H-%M-%S')
filename="$screenshot_dir/screenshot_$timestamp.png"

case "$1" in
    full)
        maim --format png > "$filename" && xclip -selection clipboard -t image/png "$filename"
        ;;
    area)
        maim -u -s && xclip -selection clipboard -t image/png "$filename"
	;;
    window)
        maim --format png --select > "$filename" && xclip -selection clipboard -t image/png "$filename"
        ;;
    *)
        echo "Usage: $0 {full|area|window}"
        exit 1
        ;;
esac

# notification
notify-send "Screenshot" "Screenshot saved as $filename"
