!/bin/sh

xrdb merge ~/.Xresources
xbacklight -set 10 &
xset r rate 200 50 &
picom &
xrandr --output HDMI-1-0 --mode 2560x1080 --refresh 75 --left-of eDP-1 &
keepassxc &
feh --no-fehbg --bg-fill --randomize ~/wallz/One-Dark/* &

dwmblocks &
dash ~/.config/dwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done
