#!/bin/bash
PW=lnpicog1
RPW=tdcscog1
##Make password consistent
echo $PW | sudo sh -c 'echo root:tdcscog1 | chpasswd'
##Make scripts executable
echo chmod +x btcc.sh
echo chmod +x btrem.sh
##Add script to crontab to activate upon reboot
echo $RPW | su -c "echo '@reboot root sh /home/tdcs/Bluetooth_fixer/btcc.sh' >> /etc/crontab" root
##Move desktop shortcut to applications folder
echo cp /home/tdcs/Bluetooth_fixer/bluetooth_reset.desktop /usr/share/applications/bluetooth_reset.desktop
echo $PW | sudo chmod a+x /usr/applications/bluetooth_reset.desktop
echo $PW | sudo dbus-launch gio set /usr/share/applications/bluetooth_reset.desktop metadata::trusted true
##Move the shortcut to the desktop
##cp bluetooth_reset.desktop /home/tdcs/Desktop/bluetooth_reset.desktop
##Make the shortcut launchable
##gio set /home/tdcs/Desktop/bluetooth_reset.desktop metadata::trusted true
##chmod a+x /home/tdcs/Desktop/bluetooth_reset.desktop
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'bluetooth_reset.desktop']"
