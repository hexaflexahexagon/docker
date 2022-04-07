#!/bin/bash

# automatically and blindly install docker on a debian-based system
# reference: https://docs.docker.com/engine/install/debian/

# remove old things
sudo apt-get remove docker docker-engine docker.io containerd runc

# install programs needed to download docker
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# add gpg sig
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# add repo into apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# allow our user to use docker without root
sudo groupadd docker 2>/dev/null
sudo usermod -aG docker $USER

# add to path if not there already
if ! $(echo "$PATH" | grep -q '/.local/bin'); then
	PATH="$PATH:$HOME/.local/bin"
fi

# if not running, start dockerd
if [[ $(ps aux | grep '/usr/bin/dockerd' | wc -l) == "1" ]]; then
	sudo /etc/init.d/docker start
fi

# test if everything worked
docker run hello-world