#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=eDP1 polybar -c $HOME/.polybar.conf top &
MONITOR=HDMI2 polybar -c $HOME/.polybar.conf top &
