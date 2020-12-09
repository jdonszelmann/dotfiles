#!/usr/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


ln -si "$DIR/.xinitrc" "$HOME"
ln -si "$DIR/30_tap.conf" "/etc/X11/xorg.conf.d"


