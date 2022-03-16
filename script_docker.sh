#!/bin/bash

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo systemctl status docker
sudo docker info | more
sudo docker build -t vane/ftpdocker .
sudo docker run --name ftpdocker -d -p 3230:21 vane/ftpdocker
sudo docker run -d --name webcontainer -p 9910:21 vane/ftpdocker
sudo docker container ls -a