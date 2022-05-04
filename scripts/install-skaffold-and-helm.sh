#!/bin/bash
helm_version=v3.8.2

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
    sudo install skaffold /usr/local/bin/

curl -Lo helm-${helm_version}-linux-amd64.tar.gz https://get.helm.sh/helm-${helm_version}-linux-amd64.tar.gz
tar -zxvf helm-${helm_version}-linux-amd64.tar.gz
sudo install linux-amd64/helm /usr/local/bin/helm

rm -rf skaffold helm-${helm_version}-linux-amd64.tar.gz linux-amd64
