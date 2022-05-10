#!/usr/bin/env bash
set -e -u -o pipefail

default_download_dir="/tmp"
download_dir=$default_download_dir

# Install Google Cloud SDK
pushd $download_dir
mkdir -p $HOME/.local/opt
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-362.0.0-linux-x86_64.tar.gz
tar xzf google-cloud-sdk-362.0.0-linux-x86_64.tar.gz
mv google-cloud-sdk $HOME/.local/opt
rm -f google-cloud-sdk-362.0.0-linux-x86_64.tar.gz
popd
pushd $HOME/.local/opt/google-cloud-sdk
/usr/bin/env bash -c './install.sh --command-completion true --path-update true --quiet'
popd

# Install Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# Install pyenv
curl https://pyenv.run | bash

# Install homebrew
sudo apt update -y
sudo apt-get install -y build-essential procps curl file git gcc
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/codespace/.bashrc

# Install kubeseal
brew update
brew install kubeseal
