#!/usr/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
CONFIG_DIR="/etc/greetd"


mkdir -p "$CONFIG_DIR"
ln -si "$DIR/config.toml" "$CONFIG_DIR"



