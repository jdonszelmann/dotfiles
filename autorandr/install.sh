#!/usr/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG_DIR="$HOME/.config/autorandr"


mkdir -p "$CONFIG_DIR"
ln -si "$DIR/postswitch" "$CONFIG_DIR"


