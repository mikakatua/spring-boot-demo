#!/bin/bash
set -euo pipefail

# Install required packages
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install --no-install-recommends \
  ca-certificates \
  curl \
  git \
  gnupg2 \
  iputils-ping \
  jq \
  libcurl4 \
  libicu60 \
  libunwind8 \
  libssl1.0 \
  lsb-release \
  maven \
  netcat \
  openjdk-11-jdk

# Install ING certificates
cp certs/*.crt /usr/local/share/ca-certificates/
update-ca-certificates

# Install Docker client
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" >> /etc/apt/sources.list
apt-get update
apt install docker-ce-cli

# Install Kubernetes CLI
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -m 0755 kubectl /usr/local/bin/kubectl

# Install security updates
apt-get -y upgrade

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*
