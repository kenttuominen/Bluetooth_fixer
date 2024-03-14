#!/bin/bash

BTCACHE_LOCATION=/var/lib/bluetooth/*
LOG=/home/tdcs/btlog.txt
PW=lnpicog1
RPW=fasd
date=$(date +'%m/%d/%y %H:%M:%S');

DEVTARG=$(echo $RPW | su -c "ls -l | grep -r 'HC-06' $BTCACHE_LOCATION" root)

DEVICE=$(expr substr $DEVTARG 38 17)

echo $DEVICE > /home/tdcs/stim_addr.txt

echo "removing stimulation device: $DEVICE | $(bluetoothctl remove $DEVICE)"
