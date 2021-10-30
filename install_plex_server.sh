#!/bin/bash

apt update && apt upgrade -y
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
apt update
apt install plexmediaserver
sudo mkdir -p /opt/plexmedia/{movies,series}
sudo chown -R plex: /opt/plexmedia
systemctl start plexmediaserver

echo "Plex Server now run at : http://localhost:32400
