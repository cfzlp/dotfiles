#!/usr/bin/env bash
set -e -u -o pipefail

default_download_dir="/tmp"
download_dir=$default_download_dir

# Install Google Cloud SDK
pushd $download_dir
mkdir -p $HOME/.local/opt
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-386.0.0-linux-x86_64.tar.gz
tar xzf google-cloud-cli-386.0.0-linux-x86_64.tar.gz
mv google-cloud-sdk $HOME/.local/opt
rm -f google-cloud-cli-386.0.0-linux-x86_64.tar.gz
popd
pushd $HOME/.local/opt/google-cloud-sdk
/usr/bin/env bash -c './install.sh --command-completion true --path-update true --quiet'
popd

# # Install pyenv
# curl https://pyenv.run | bash

# # Install homebrew
# sudo apt-get update -y && sudo apt-get install -y build-essential procps curl file git gcc
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/codespace/.bashrc

# # Installs with Terraform
# /home/linuxbrew/.linuxbrew/bin/brew update
# /home/linuxbrew/.linuxbrew/bin/brew install kubeseal
# /home/linuxbrew/.linuxbrew/bin/brew install terraform
