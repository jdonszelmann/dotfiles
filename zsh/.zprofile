#export _JAVA_AWT_WM_NONREPARENTING=1

#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -le 3 ]]; then
#  exec startx
#fi

