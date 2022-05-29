#!/bin/bash

# remove docker
sudo apt remove -y \
	docker \
	docker-engine \
	docker.io \
	containerd \
	runc

# install required packages
sudo apt update -y 
sudo apt install -y \
	ca-certificates \
	curl \
	gnupg \
	lsb-release

# add key and repo
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install packages
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
