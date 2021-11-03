#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
apt update
apt install plexmediaserver -y
sudo mkdir -p /opt/plexmedia/{movies,series}
sudo chown -R plex: /opt/plexmedia
systemctl start plexmediaserver

echo "Plex Server now run at : http://localhost:32400
