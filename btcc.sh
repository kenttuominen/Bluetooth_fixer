#!/bin/bash

BTCACHE_LOCATION=/var/lib/bluetooth/*
LOG=/home/tdcs/Bluetooth_fixer/btlog.txt
RPW=tdcscog1
date=$(date +'%m/%d/%y %H:%M:%S');

##Recreates the bluetooth folder in /var/lib effectively clearing the cache of any previous devices. Reboots bluetooth module
echo $RPW | su -c "cd /var/lib && rm -r bluetooth && mkdir bluetooth && systemctl restart bluetooth" root
##Clears pagecache, dentries, inodes, and swap memory - may help if there is a caching error
echo $RPW | su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root

##Prints whether or not the script was ran successfully and at what time.
if [ $? -ne 0 ]; then
	echo "Error occurred on $date" >> $LOG
	zenity \
	--error \
	--text "<b>An Error has occurred</b>.\nCache has not been cleared. Please check the logs." \
	--width 300
else
##If succesful, log is overwritten with the date and time of the last clearing
	echo "Bluetooth and RAM cache last cleared on $date" > $LOG
	zenity \
	--notification \
	--text "Caches cleared!"
fi
