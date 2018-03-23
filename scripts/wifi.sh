#!/bin/bash


# constants
# ---------
wifi_file="/etc/wpa_supplicant/wireless_networks.conf"
wifi_card="wlp3s0"

# reconnect using wpa_supplicant
# ------------------------------
wifi_connect() {
    sudo pkill wpa_supplicant
    sudo pkill dhcpcd
    sudo wpa_supplicant -B -Dnl80211 -i"$wifi_card" -c"$wifi_file"
    sudo dhcpcd "$wifi_card"
}

# scan for networks in area
# -------------------------
wifi_scan() {
    sudo iw dev "$wifi_card" scan \
        | grep 'SSID:' \
        | sed -e 's/^[ \t]*SSID:[ \t]*//' \
        | grep -v '\x00'
}

# set wifi card up
# ----------------
wifi_up() {
    sudo pkill wpa_supplicant
    sudo pkill dhcpcd
    sudo ip link set $wifi_card up
}

# kill wifi
wifi_kill() {
	sudo pkill wpa_supplicant
	sudo pkill dhcpcd
}

# interface
# ---------
wifi_command="$1"
shift
case "$wifi_command" in
    c|connect)
        wifi_connect $@
        ;;
    s|scan)
        wifi_scan $@
        ;;
    u|up)
        wifi_up $@
        ;;
    d|disconnect)
	wifi_kill $@
	;;
    *)
        echo "Unrecognized command: '$wifi_command'"
        ;;
esac

