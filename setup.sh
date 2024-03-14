#!/bin/bash
PW=lnpicog1
RPW=fasd

echo $PW | sudo chmod +x btcc.sh | echo $PW | sudo chmod +x btrem.sh
echo $RPW | su -c "echo '@reboot    root sh /home/tdcs/btcc.sh' >> /etc/crontab"
mv bluetooth_reset.desktop /home/tdcs/Desktop/bluetooth_reset.desktop
gio set /home/tdcs/Desktop/bluetooth_reset.desktop metadata::trusted true
chmod a+x /home/tdcs/Desktop/bluetooth_reset.desktop
