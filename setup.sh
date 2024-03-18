#!/bin/bash
PW=lnpicog1
RPW=tdcscog1

##Make password consistent
echo $PW | sudo sh -c 'echo 'root:tdcscog1' | chpasswd' 2>/dev/null
##Make scripts executable
echo $RPW | su -c 'chmod +x /home/tdcs/Bluetooth_fixer/btcc.sh' root
echo $RPW | su -c 'chmod +x /home/tdcs/Bluetooth_fixer/btrem.sh' root
##Add script to crontab to activate upon reboot
echo $RPW | su -c "echo '@reboot root sh /home/tdcs/Bluetooth_fixer/btcc.sh' >> /etc/crontab" root
##Move desktop shortcut to applications folder and make it launchable
echo $RPW | su -c 'cp /home/tdcs/Bluetooth_fixer/bluetooth_reset.desktop /usr/share/applications/bluetooth_reset.desktop' root
echo $RPW | su -c 'chmod a+x /usr/share/applications/bluetooth_reset.desktop' root
dbus-launch gio set /usr/share/applications/bluetooth_reset.desktop metadata::trusted true

##Could maybe get this working for other studies that may want to keep their favorites in tact. Unfortunately gsettings doesn't like variables
##FAVORITES=$(gsettings get org.gnome.shell favorite-apps | sed 's/.$//')
##FIX='"'"${FAVORITES}, 'bluetooth_reset.desktop']"'"'
##gsettings set org.gnome.shell favorite-apps $FIX

##Add the reset button to the favorites bar. Using gsettings set overwrites the current array, so these must be modified manually.
gsettings set org.gnome.shell favorite-apps "['taskflow_taskflow.desktop', 'zoom-client_zoom-client.desktop', 'firefox.desktop', 'bluetooth_reset.desktop']"
touch /home/tdcs/Bluetooth_fixer/btlog.txt
touch /home/tdcs/Bluetooth_fixer/stim_addr.txt

##Transfer all permissions to tdcs user for the scripts
echo $RPW | su -c 'chown -R tdcs /home/tdcs/Bluetooth_fixer' root
