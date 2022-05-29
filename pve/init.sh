#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# proxmox repositories
rm /etc/apt/sources.list.d/pve-enterprise.list
cp pve-no-subscription.list /etc/apt/sources.list.d/pve-no-subscription.list

# update packages
apt update -y
apt dist-upgrade -y
apt upgrade -y

# install snap
apt install -y snapd

# install and configure fish shell
apt install -y fish
snap install starship
mkdir -p /root/.config/fish
cp ../shared/config.fish /root/.config/fish/config.fish

# set root default shell to fish
usermod --shell /bin/fish root
