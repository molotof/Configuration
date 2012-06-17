#!/bin/bash
export WINDOW_MANAGER='herbstluftwm'
#export WINDOW_MANAGER='i3'
export BROWSER='open'

for m in LVDS{,1}; do
    if [[ $HOSTNAME == 'iandrio' ]]; then
        xrandr --output $m --off
    else
        xrandr --output $m --set "scaling mode" Full
    fi
done
if [[ $HOSTNAME == 'iandrio' ]]; then
    xrandr --newmode '1280x1024i' 110.0 1280 1360 1472 1728 1024 1028 1036 \
        1076 Interlace -Hsync -Vsync
    xrandr --addmode VGA-0 1280x1024i
    xrandr --output VGA-0 --mode 1024x768
fi

xsetroot -solid black
feh --bg-fill ~/.background-busy
xrefresh

setxkbmap -layout 'us(colemak),us' -option 'compose:ralt' \
    -option 'grp:shift_caps_toggle' -option 'keypad:pointerkeys'
xbindkeys
# vodik » Wntrvnm: btw synclient is outdated, you may want to consider moving
# to xinput
# *Action » Wntrvnm adds a note
#syndaemon -d -t -i2
#synclient CornerCoasting=1
#synclient VertTwoFingerScroll=1
#synclient HorizTwoFingerScroll=1
#synclient TrackstickSpeed=40
redshift-wrapper &
pidof mpd &> /dev/null || mpd ${HOME}/.config/mpd/mpd.conf
#pidof mpdscribble || mpdscribble
dunst -nb white -nf black &
parcellite &


ck='ck-launch-session dbus-launch --sh-syntax --exit-with-session'
case "$WINDOW_MANAGER" in
    'i3')
        i3 --version | grep -q tree &&
            exec i3 -c ~/.config/i3/config.tree ||
            exec i3 -c ~/.config/i3/config
        ;;
    *)
        exec $ck "$WINDOW_MANAGER"
        ;;
esac
