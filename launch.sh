#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi

sed 1d "$HOME/.fehbg" | cut -d "'" -f 2 | xargs wallust run

echo "Bars launched..."
