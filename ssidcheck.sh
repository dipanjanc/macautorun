	# This will get the current SSID of the Wi-Fi network that you are attached to. IF any.
	#
	# If blank, either the computer is not connected to any Wi-Fi networks, or the AirPort interface is disabled or turned off
	#
#	Defining what are home & work apps 
USER=$(whoami)
MACAUTORUN_PATH="/Users/$USER/Dropbox/wizardry/bbspeedlogger"
TMP="$MACAUTORUN_PATH/.temp"

typeset -a WORK_APPS HOME_APPS

	# These are apps you use at work

# Block with conditions
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $NF}')

	#	We compare the SSID we found against those we have been told about:
case "$SSID" in

	"L&L OUTSIDE")
						printf "This is your HOME network"
						terminal-notifier -message "Brock! $SSID is your HOME network" -title "ssidchecker says"
						sh homeapps.sh
						for app in " "Google\ Chrome" "Fantastical" "Evernote" "MindNode" "Messages" "DeskChat" "Sublime""Sublime\ Text""; do
  						killall "${app}" > /dev/null 2>&1
						done
	exit 0
	;;

	"eM-D3148_5G")
						printf "This is your OFFICE network"
						terminal-notifier -message "Brock! $SSID is your OFFICE network" -title "ssidchecker says"
						sh workapps.sh
						for app in ""Dropbox" "Plex\ Media\ Server" "Mobile\ Mouse\ Server" "iTunes""; do
  						killall "${app}" > /dev/null 2>&1
						done
	exit 0
	;;

esac

printf "This network is unknown. The SSID is: $SSID."
terminal-notifier -message "This network ($SSID) is unknown." -title "ssidchecker says"


#
#EOF