#!/usr/bin/env bash
sudo apt-get update --fix-missing --assume-yes;
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common gnupg2 --assume-yes;

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable";
sudo apt-get update --fix-missing --assume-yes;
sudo apt-get install docker-ce --assume-yes;
sudo usermod -aG docker $USER;

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
sudo chmod +x /usr/local/bin/docker-compose;