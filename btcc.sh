#!/bin/bash

BTCACHE_LOCATION=/var/lib/bluetooth/*
LOG=/home/tdcs/btlog.txt
PW=lnpicog1
RPW=fasd
date=$(date +'%m/%d/%y %H:%M:%S');

echo $RPW | su -c "cd $BTCACHE_LOCATION && rm -r cache && mkdir cache" root
echo $RPW | su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root

if [ $? -ne 0 ]; then
	echo "Error occurred on $date" >> $LOG
else
	echo "Bluetooth and RAM cache last cleared on $date" > $LOG 
fi
