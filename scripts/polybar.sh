#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar -c $HOME/.polybar.conf bar &

#if [ $(hostname) = 'annedouwe-pc' ]; then
	#MONITOR=VGA-1 polybar -c $HOME/.polybar.conf bar &
	#MONITOR=DVI-0 polybar -c $HOME/.polybar.conf bar &
#else
#fi
