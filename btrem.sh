#!/bin/bash
#set -x
BTCACHE_LOCATION=/var/lib/bluetooth/*
LOG=/home/tdcs/Bluetooth_fixer/btlog.txt
RPW=tdcscog1
date=$(date +'%m/%d/%y %H:%M:%S');
##Find bluetooth devices with HC-06 in their info file
DEVTARG=$(echo $RPW | su -c "ls -l | grep -r 'HC-06' $BTCACHE_LOCATION" root)
##Pull MAC addr. from the path string
DEVICE=$(expr substr $DEVTARG 38 17)
if [ $? -ne 0 ]; then
        zenity \
        --error \
        --text "<b>Could not remove device</b>\nNo device found." \
        --width 200\
        --height 100\
        --title "Device Remover"
	exit
fi
##Log MAC addr. if diagnostics are needed
echo $DEVICE > /home/tdcs/Bluetooth_fixer/stim_addr.txt
##Remove the device via bluetoothctl
echo "$DEVICE | $(bluetoothctl remove $DEVICE)"
if [ $? -ne 0 ]; then
	zenity \
	--error \
	--text "Could not remove device.\nNo device found." \
	--width 200\
	--height 100\
	--title "Device Remover"
else
	zenity \
	--notification \
	--text "Device Removed" \
	--width 200
fi

