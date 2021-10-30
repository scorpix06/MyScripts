#!/bin/bash

adduser --disabled-password --system --home /var/lib/deluge --gecos "Deluge service" --group deluge
touch /var/log/deluged.log
touch /var/log/deluge-web.log
chown deluge:deluge /var/log/deluge*
apt-get update
apt-get install deluged
apt-get install deluge-web

echo "[Unit]
Description=Deluge Bittorrent Client Daemon
After=network-online.target

[Service]
Type=simple
User=deluge
Group=deluge
UMask=000

ExecStart=/usr/bin/deluged -d

Restart=on-failure

# Configures the time to wait before service is stopped forcefully.
TimeoutStopSec=300

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/deluged.service

systemctl start deluged
systemctl enable deluged

echo "[Unit]
Description=Deluge Bittorrent Client Web Interface
After=network-online.target

[Service]
Type=simple

User=deluge
Group=deluge
UMask=027

ExecStart=/usr/bin/deluge-web -d

Restart=on-failure

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/deluge-web.service

systemctl start deluge-web
systemctl enable deluge-web
