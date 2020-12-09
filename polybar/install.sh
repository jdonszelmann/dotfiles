#!/usr/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG_DIR="$HOME/.config/polybar"


mkdir -p "$CONFIG_DIR"
ln -si "$DIR/config" "$CONFIG_DIR"
ln -si "$DIR/launch.sh" "$CONFIG_DIR"


