#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=eDP1 polybar -c $HOME/.polybar.conf top &
MONITOR=HDMI2 polybar -c $HOME/.polybar.conf top &
MONITOR=eDP1 polybar -c $HOME/.polybar.conf bottom &
MONITOR=HDMI2 polybar -c $HOME/.polybar.conf bottom &

#if [ $(hostname) = 'annedouwe-pc' ]; then
	#MONITOR=VGA-1 polybar -c $HOME/.polybar.conf bar &
	#MONITOR=DVI-0 polybar -c $HOME/.polybar.conf bar &
#else
#fi
