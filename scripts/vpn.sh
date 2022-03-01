#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

print_vpn_ip() {
	IFACE_ETH0='ens33'
	IFACE_TUN0='tun0'

	IFACE=$IFACE_TUN0
	MESSAGE="vpn:"
	ADDRESS=$(ip -4 address show $IFACE &>/dev/null)
	if [ $? -eq 1 ]; then
	    IFACE=$IFACE_ETH0
	    MESSAGE="local:"
	fi    

	IP=$(ip -4 address show $IFACE | grep 'inet' | sed 's/.*inet \([0-9\.]\+\).*/\1/')
	printf "$MESSAGE$IP"
}

print_vpn_ip
