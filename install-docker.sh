#!/bin/bash
#Author: 	Kasey Martin
#Email: 	kasey.hackspace@gmail.com
#Date:		2018-11-11
#Usage:		./install-docker.sh
#Description:
# 
# Installs docker on Ubuntu 18.04 based on 
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

echo Updating package lists
sudo apt update
echo Installing prerequisites for Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
echo adding Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
echo Installing Docker
sudo apt install -y docker-ce

echo adding local user for docker
sudo usermod -aG docker ${USER}
id -nG

sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker --version
docker-compose --version
