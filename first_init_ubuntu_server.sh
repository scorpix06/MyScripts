#!/bin/bash

timezone=Europe/Paris
ssh_gh_hostname=scorpix06

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

echo "[X] Importing ssh public key"
ssh-import-id-gh $ssh_gh_hostname

echo "[X] Changing timezone to " $timezone
timedatectl set-timezone $timezone

echo "[X] Enter the name of the server : "
read name
echo "[X] Changing hostname"

hostnamectl set-hostname $name
hostnamectl set-hostname $name --pretty

