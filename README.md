# Bluetooth fixer
### Designed to help alleviate weird connectivity issues between Ubuntu and Taskflow stimulation device

Still a work in progress.

## Install
1. Clone the repo to the tdcs home folder (/home/tdcs), using `git clone https://github.com/kenttuominen/Bluetooth_fixer`
2. Enter the folder labeled Bluetooth_fixer using the command `cd ~/Bluetooth_fixer` or `cd /home/tdcs/Bluetooth_fixer`
3. Run the **setup.sh** script by typing `bash setup.sh`

   *if you get an error that says permission denied type the following commands:*
   `cd ..` -> `sudo chown -R tdcs Bluetooth_fixer` you may be prompted for a password, enter `lnpicog1` -> repeat steps 2 and 3
   
*Make sure you do not run the command as root user; if you do not know what this is don't worry*

4. Enter the password for the computer if prompted and wait ~30 seconds
5. You should see the bluetooth reset icon appear in the favorites bar on the left.

## Updating (if Bluetooth Reset icon is already present)
1. Open Terminal (Press Windows Key -> Search for 'Terminal'
2. Run the following command: `sudo rm -r Bluetooth_fixer && git clone https://github.com/kenttuominen/Bluetooth_fixer && cd Bluetooth_fixer && bash setup.sh`
3. Enter the computer password labelled in the bottom left bezel of the screen

*Double check update is applied by opening settings to the Bluetooth page, when the reset button is pressed you should see all devices disappear and bluetooth will turn off and on again*

## Usage
- Clicking the Bluetooth refresh button will clear the page-cache, dentries, inodes, and swap-memory
- You may right click press "Remove Stimulation Device"

## Notes
These connectivity issues appear to be specific to v4 devices and the 20.04 Ubuntu OS drivers; This is likely unnecessary for v5 devices, but does provide a one click solution to clear all cache in instances where light trouble-shooting is needed.
