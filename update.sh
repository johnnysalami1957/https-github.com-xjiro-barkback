#!/bin/sh

wget -q --spider http://github.com

if [ $? -eq 0 ]; then
    echo "Online"
    cd /home/pi/upwork.barkback
    echo "Updating from Github..."
    git pull
    git rev-parse --short HEAD > /home/pi/current_version
    if cmp /home/pi/current_version /home/pi/last_version; then
        echo "No updates"
    else
        echo "Update found, rebooting"
        cp /home/pi/current_version /home/pi/last_version
        sudo reboot
    fi
    echo "Done"
else
    echo "Offline"
fi