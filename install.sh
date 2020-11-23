#!/bin/sh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install sox python python-pip
pip install -r requirements.txt

sudo mkdir /mnt/ramdisk
sudo echo 'tmpfs /var/ramdisk tmpfs nodev,nosuid,size=100M 0 0' >> /etc/fstab
 
chmod u+x /home/pi/upwork.barkback/update.py

echo 'Reboot Pi to mount ramdisk'