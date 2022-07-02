#!/bin/zsh

# Gets the currently connected network
getnet () {
	connected_network=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/ {print $2}' | xargs)

	if [[ -z $connected_network ]]; then
		echo "Network unavailable."
		return 1
	else
		echo $connected_network
		return 0
	fi
}
