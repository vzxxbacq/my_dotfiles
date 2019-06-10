#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done



# Launch bar1 and bar2 
polybar top &
#if type "xrandr";then
#	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#		MONITOR=$m polybar top &
#	done
#else
#        polybar top &
#fi

if type "xrandr";then
	for m in $(xrandr --query | grep "connected" | cut -d" " -f1);do
		DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1) MONITOR=$m polybar --reload bottom &
	done
else
        polybar --reload bottom &
fi

echo "Bars launched..."
