#!/bin/bash

timer -f -n Work 45m \
&& (espeak "Take a break you brilliant bastard" \
& notify-send --app-name="Dirty Pomodoro" "Break" "Take a break")

timer -f -n Break 15m \
&& (espeak "Get back to work you lazy bitch" \
& notify-send --app-name="Dirty Pomodoro" "Work" "Get back to work")

exit 0
