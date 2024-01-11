#!/usr/bin/env bash

iDIR="/usr/share/icons/Fluent-purple-dark/24/panel"

# Get Volume
get_volume() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}'
}

# Get icons
get_icon() {
  current=$(get_volume)

  if [ "$(echo "$current == 0.00" | bc -l)" -eq 1 ]; then
    echo "$iDIR/volume-level-muted.svg"
  elif [ "$(echo "$current <= 0.30" | bc -l)" -eq 1 ]; then
    echo "$iDIR/volume-level-low.svg"
  elif [ "$(echo "$current <= 0.60" | bc -l)" -eq 1 ]; then
    echo "$iDIR/volume-level-medium.svg"
  else
    echo "$iDIR/volume-level-high.svg"
  fi
}

# Notify
notify_user() {
  notify-send -h string:x-canonical-private-synchronous:sys-notify --app-name="Volume" -u low -i "$(get_icon)" "$(get_volume)%"
}

# Increase Volume
inc_volume() {
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ && notify_user
}

# Decrease Volume
dec_volume() {
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%- && notify_user
}

# Toggle Mute
toggle_mute() {
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -h string:x-canonical-private-synchronous:sys-notify --app-name="Volume" -u low -i "$iDIR/volume-level-muted.svg" "$(get_volume)%"

}

# Execute accordingly
case "$1" in
  "--get") get_volume ;;
  "--inc") inc_volume ;;
  "--dec") dec_volume ;;
  "--toggle") toggle_mute ;;
  "--get-icon") get_icon ;;
  *) get_volume ;;
esac

exit 0
