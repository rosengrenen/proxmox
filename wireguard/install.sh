#!/bin/sh

sudo ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf
sudo apt install -y wireguard
sudo systemctl enable --now wg-quick@wg0.service
docker network create --subnet 172.18.0.0/16 00_wg0
