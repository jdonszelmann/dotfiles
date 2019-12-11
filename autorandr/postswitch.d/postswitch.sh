#!/usr/bin/env zsh
# -*- mode:sh


notify-send "autorandr: restarting polybar"

# sleep 2 && \
#     && \
#    $HOME/.config/polybar/launch


# Sets the touchscreen to be mapped to the range of the main screen (eDP1)
xinput --map-to-output $(xinput list --id-only "Wacom HID 48DE Finger") eDP-1
