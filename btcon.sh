#!/bin/bash

bluetoothctl devices | grep -iF HC-06 | awk '{print $2}'
