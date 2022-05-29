#!/bin/bash

script_loc=$(echo $BASH_SOURCE | sed 's/init.sh//g')

export DEBIAN_FRONTEND=noninteractive

# update packages
apt update -y
apt upgrade -y

# reinstall cloud-init
apt remove --purge -y cloud-init
apt autoremove -y
rm -rf /etc/cloud
apt install -y cloud-init
cp $script_loc/cloud.cfg /etc/cloud/cloud.cfg

# install qemu guest agent
apt install -y qemu-guest-agent

# install and configure fish shell
apt install -y fish
snap install starship
mkdir -p /root/.config/fish
cp $script_loc/../shared/config.fish /root/.config/fish/config.fish
mkdir -p /etc/skel/.config/fish
cp $script_loc/../shared/config.fish /etc/skel/.config/fish/config.fish

# set root default shell to fish
usermod --shell /bin/fish root

# remove default user
user=$(cat /etc/passwd | grep 1000:1000 | awk -F : '{print $1}')
deluser $user --remove-home

# disable root password
passwd -d root
passwd -l root

# set empty machine id
echo "" > /etc/machine-id

# clear history
rm -f /root/.local/share/fish/fish_history
rm -f /root/.bash_history

# self destruct
rm -r $script_loc/..

# restart
reboot
