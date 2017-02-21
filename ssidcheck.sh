	# This will get the current SSID of the Wi-Fi network that you are attached to. IF any.
	#
	# If blank, either the computer is not connected to any Wi-Fi networks, or the AirPort interface is disabled or turned off
	#
#	Defining what are home & work apps 
typeset -a WORK_APPS HOME_APPS

	# These are apps you use at work
WORK_APPS=(Mindnode iTerm Polymail Fantastical "Sublime Text" "Google Chrome")

	# These are apps you use at home
HOME_APPS=(iTunes Dropbox Evernote Plex)
quit_apps () {

for APP_TO_QUIT in "$@"
do

# Check to see if the app is running
ps cx | grep -qiE " ${APP_TO_QUIT}$"

EXIT="$?"

if [ "$EXIT" = "0" ]
then

# if we get here, it is running

/usr/bin/osascript <<EOT
tell application "$APP_TO_QUIT" to quit

EOT

else

printf "$NAME: $APP_TO_QUIT is not running"

fi

done

}

####|####|####|####|####|####|####|####|####|####|####|####|####|####|####

run_apps () {

for APP_TO_RUN in "$@"
do

# Check to see if the app is running
ps cx | grep -qiE " ${APP_TO_RUN}$"

EXIT="$?"

if [ "$EXIT" = "0" ]
then

		printf "	$NAME: $APP_TO_RUN is already running"
		terminal-notifier -message "$NAME: $APP_TO_RUN is already running" -title "ssidchecker says"
else

		open -g -a ${APP_TO_RUN}
		terminal-notifier -message "$NAME: $APP_TO_RUN is running" -title "ssidchecker says"
fi

done

}
# Block with conditions
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F': ' '/ SSID/{print $NF}')

	#	We compare the SSID we found against those we have been told about:
case "$SSID" in

	"Brockster_5G")
						printf "This is your HOME network"
						terminal-notifier -message "This is your HOME network" -title "ssidchecker says"
						run_apps ${HOME_APPS}
						quit_apps ${WORK_APPS}
	exit 0
	;;

	"eM-D3148_5G")
						printf "This is your OFFICE network"
						terminal-notifier -message "This is your OFFICE network" -title "ssidchecker says"
						run_apps ${WORK_APPS}
						quit_apps ${HOME_APPS}
	exit 0
	;;

esac

printf "This network is unknown. The SSID is: $SSID."
terminal-notifier -message "This network ($SSID) is unknown." -title "ssidchecker says"
;;

#
#EOF