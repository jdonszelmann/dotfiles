#!/bin/bash

function moveWindow {
    id=$(bspc query --nodes --node)
    bspc node -d "$1"
    bspc desktop -f "$1"
    bspc node --focus ${id}
};

function notifyVolume {
    notify-send --hint=string:x-dunst-stack-tag:test "Volume" \
        $(amixer -c 1 -M -D pulse get Master | grep -o -E '[0-9]+%' | tail -n 1)
}

function notifyMute {
    [[ "$(pacmd list-sinks | grep muted | awk '{print $2}')" == 'yes' ]] \
        && notify-send --hint=string:x-dunst-stack-tag:test "Sound muted" || notify-send --hint=string:x-dunst-stack-tag:test "Sound on"
}

toggleMic() {
    amixer set Capture toggle && \
        amixer get Capture | grep '\[off\]' && \
        notify-send "Microphone muted" || notify-send "Microphone unmuted"
}
