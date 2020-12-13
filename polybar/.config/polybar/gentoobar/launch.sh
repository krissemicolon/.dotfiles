#!/usr/bin/env sh

# Gentoobar launcher

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar main -c ~/.config/polybar/gentoobar/config.ini &

