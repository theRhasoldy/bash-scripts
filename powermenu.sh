#!/bin/bash
option1=""
option2="󰤄"
option3=""
option4=""
option5="⏻"

options="$option1\n$option2\n$option3\n$option4\n$option5"

choice=$(echo -e "$options" | rofi -config ~/.config/rofi/powermenu.rasi -dmenu -window-title "") 

case $choice in
	"$option1")
		swaylock ;;
	"$option2")
    systemctl suspend ;;
	"$option3")
    hyprctl dispatch exit ;;
	"$option4")
    systemctl reboot ;;
	"$option5")
		systemctl poweroff ;;
esac

