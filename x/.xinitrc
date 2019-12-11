#!/usr/bin/env sh

export GTK_THEME=Arc
export _JAVA_AWT_WM_NONREPARENTING=1
wal -R
exec bspwm > /tmp/bspwm.log 2>&1 


