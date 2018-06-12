#!/bin/bash

# setting up for HDMI2
#xrandr --addmode HDMI2 --auto --right-of eDP1

# default monitor
MONITOR=eDP1

# functions to switch from eDP1 to HDMI2
function ActivateHDMI {
	echo "Activating External Display"
	if xrandr | grep HDMI1 | grep connected
	then
		exec xrandr --output HDMI1 --auto --right-of eDP1
		MONITOR = HDMI1
	fi
	
	if xrandr | grep HDMI2 | grep connected
	then
		exec xrandr --output HDMI2 --auto --right-of eDP1
		MONITOR = HDMI2
	fi

	if xrandr | grep DP1 | grep connected
	then
		exec xrandr --output DP1 --auto --right-of eDP1
		MONITOR = DP1
	fi
}
function DeactivateHDMI {
	echo "Deactivating HDMI2"
	if [ $MONITOR = "HDMI1" ]
	then
		exec xrandr --output HDMI1 --off
	fi

	if [ $MONITOR = "HDMI2" ]
	then
		exec xrandr --output HDMI2 --off
	fi

	if [ $MONITOR = "DP1" ]
	then
		exec xrandr --output DP1 --off
	fi
	MONITOR=eDP1
}

# check if HDMI2 is connected 
function HDMIActive {
	[ $MONITOR = "HDMI1" ] || [ $MONITOR = "HDMI2" ] || [ $MONITOR = "DP1" ]
}
function HDMIConnected {
	[xrandr | grep HDMI1 | grep connected] || [xrandr | grep HDMI2 | grep connected] || [xrandr | grep DP1 | grep connected]
}

# script
while true
do
	if HDMIConnected && ! HDMIActive
	then
		ActivateHDMI
	fi

	if ! HDMIConnected && HDMIActive
	then
		DeactivateHDMI
	fi

	sleep 1s
done
