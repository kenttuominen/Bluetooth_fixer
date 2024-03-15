#!/bin/bash

BTCACHE_LOCATION=/var/lib/bluetooth/*
LOG=/home/tdcs/Bluetooth_fixer/btlog.txt
RPW=tdcscog1
date=$(date +'%m/%d/%y %H:%M:%S');

##Find bluetooth devices with HC-06 in their info file
DEVTARG=$(echo $RPW | su -c "ls -l | grep -r 'HC-06' $BTCACHE_LOCATION" root)

##Pull MAC addr. from the path string
DEVICE=$(expr substr $DEVTARG 38 17)

##Log MAC addr. if diagnostics are needed
echo $DEVICE > /home/tdcs/Bluetooth_fixer/stim_addr.txt

##Remove the device via bluetoothctl
echo "$DEVICE | $(bluetoothctl remove $DEVICE)"

##Prints whether or not the script was ran successfully and at what time.
if [ $? -ne 0 ]; then
	echo "Error occurred on $date Device was not removed" >> $LOG
else
	echo "Device was removed successfully on $date" >> $LOG 
fi
