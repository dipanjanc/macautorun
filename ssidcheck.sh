	# This will get the current SSID of the Wi-Fi network that you are attached to. IF any.
	#
	# If blank, either the computer is not connected to any Wi-Fi networks, or the AirPort interface is disabled or turned off
	#
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $NF}')

	#	We compare the SSID we found against those we have been told about:
case "$SSID" in

	"Brockster_5g")
						printf "This is your HOME network"
						terminal-notifier -message "This is your HOME network" -title "ssidchecker says"
	exit 0
	;;

	"eM-D3148_5G")
						printf "This is your OFFICE network"
						terminal-notifier -message "This is your OFFICE network" -title "ssidchecker says"
	exit 0
	;;

esac

printf "This network is unknown. The SSID is: $SSID."
terminal-notifier -message "This network ($SSID) is unknown." -title "ssidchecker says"