#!/usr/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG_DIR="$HOME/.config/sxhkd"


mkdir -p "$CONFIG_DIR"
ln -si "$DIR/sxhkdrc" "$CONFIG_DIR"
ln -si "$DIR/scripts.sh" "$CONFIG_DIR"


