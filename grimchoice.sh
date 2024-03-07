#!/bin/bash

option1="󰩬 󰆓 Select area and copy"
option2="󰒆 󰆓 Select area and save"

options="$option1\n$option2"

choice=$(echo -e "$options" | rofi -config ~/.config/rofi/app.rasi -dmenu -window-title 󰄀 )

case $choice in
    "$option1")
        grimshot --notify copy area
    ;;
    "$option2")
      grimshot --notify save area
    ;;
esac

exit 0
