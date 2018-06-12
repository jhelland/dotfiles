#!/bin/bash

# setting up for HDMI2
#xrandr --addmode HDMI2 --auto --right-of eDP1

# default monitor
MONITOR=eDP1

# port names
PORTS="$(xrandr | grep -oP '^.[^0-9 ]+')"

function IsActive {
	[[ $MONITOR = $1 ]]
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
	for port in $DEVS  # $PORTS
  {
    if [[ $port == "Screen" ]]
    then
      continue
    fi

		if IsConnected $port && ! IsActive $port
		then
			ActivateInput $port
		fi

		if ! IsConnected $port && IsActive $port
		then
			DeactivateInput $port
		fi
  }

	sleep 1s
done
