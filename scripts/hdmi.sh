#!/bin/bash

# setting up for HDMI2
#xrandr --addmode HDMI2 --auto --right-of eDP1

# default monitor
MONITOR=eDP1

function IsActive {
	[ $MONITOR = $1 ]
}
function IsConnected {
	! xrandr | grep $1 | grep disconnected
}
function ActivateInput {
	echo "Activating $1"
	exec xrandr --output $1 --auto --right-of eDP1
	MONITOR=$1
}
function DeactivateInput {
	echo "Deactivating $1"
	exec xrandr --output $1 --off
	MONITOR=eDP1
}

# script
while true
do
	DEVS="DP1 HDMI1 HDMI2"
	for word in $DEVS
  {
		if IsConnected $word && ! IsActive $word
		then
			ActivateInput $word	
		fi

		if ! IsConnected $word && IsActive $word
		then
			DeactivateInput $word
		fi
  }

	sleep 1s
done
