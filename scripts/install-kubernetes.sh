#!/bin/bash

# prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# kubectl apt config & key
sudo curl -fsSLo /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# kubectl install
sudo apt-get update
sudo apt-get install -y kubectl

echo 'source <(kubectl completion bash)' >>~/.bashrc
