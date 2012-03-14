#!/bin/bash
DESKTOP_ENV=""
if which /usr/lib/openbox/xdg-autostart >/dev/null; then
    /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
fi
reset-tint2 &
feh --bg-fill ~/.background
