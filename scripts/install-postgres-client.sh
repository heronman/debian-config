#!/bin/bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc \
  | gpg --dearmor \
  | sudo tee /etc/apt/trusted.gpg.d/pgdg.gpg >/dev/null
sudo apt-get update
