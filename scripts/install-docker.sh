#!/bin/bash

sudo apt remove docker docker-engine docker.io containerd runc

sudo apt update

sudo apt install ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg |
    sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

dcversion=1.29.2
sudo curl -L "https://github.com/docker/compose/releases/download/$(dcversion}/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/${dcversion}/contrib/completion/bash/docker-compose \
  -o /etc/bash_completion.d/docker-compose
#dcversion=$([[ $(docker-compose --version) =~ version[[:space:]]+([0-9.]+), ]] && echo ${BASH_REMATCH[1]})

echo
echo "*Notice: Don't forget to add whoever needs to work with the docker to the group 'docker':"
echo "    \"$ sudo usermod -a -G docker {username}\""
