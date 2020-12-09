#!/usr/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG_DIR="$HOME/.config/bspwm"


mkdir -p "$HOME/.config/background"
mkdir -p "$CONFIG_DIR"
ln -si "$DIR/bspwmrc" "$CONFIG_DIR"
ln -si "$DIR/resize" "$CONFIG_DIR"


