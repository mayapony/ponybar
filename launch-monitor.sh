#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) polybar -c $HOME/.config/polybar/bar-config main &
else
  primary=$(xrandr --query | grep primary | cut -d" " -f1)

  for m in $screens; do
    echo $m
    if [[ $primary == $m ]]; then
        MONITOR=$m polybar -c $HOME/.config/polybar/bar-config secondary &
    else
        MONITOR=$m polybar -c $HOME/.config/polybar/bar-config main &
    fi
  done
fi
