#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

echo "Setting up TZ"
apt-get update
ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
apt-get install -y tzdata

echo "Installing required packages"
apt-get install -y \
    curl \
    zip \
    gnupg \
    software-properties-common \
    python3-pip

echo "Installing AWS CLI"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

echo "Installing Terraform"
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - 
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 
apt-get update
apt-get install terraform -y