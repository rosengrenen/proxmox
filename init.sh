#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# update packages
apt update -y
apt upgrade -y

# reinstall cloud-init
apt remove --purge -y cloud-init
apt autoremove -y
rm -rf /etc/cloud
apt install -y cloud-init
cp cloud.cfg /etc/cloud/cloud.cfg

# install qemu guest agent
apt install -y qemu-guest-agent

# install and configure fish shell
apt install -y fish
snap install starship
mkdir -p /home/root/.config/fish
cp config.fish /home/root/.config/fish/config.fish
mkdir -p /etc/skel/.config/fish
cp config.fish /etc/skel/.config/fish/config.fish

# remove default user
user=$(cat /etc/passwd | grep 1000:1000 | awk -F : '{print $1}')
deluser $user

# disable root password
passwd -d root
passwd -l root

# set empty machine id
echo "" > /etc/machine-id
