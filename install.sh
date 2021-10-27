#!/usr/bin/env bash
set -e -u -o pipefail

default_download_dir="/tmp"
download_dir=$default_download_dir

# Install Google Cloud SDK
pushd $download_dir
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-362.0.0-linux-x86_64.tar.gz
tar xzf google-cloud-sdk-362.0.0-linux-x86_64.tar.gz
mkdir -p $HOME/.local/opt
mv google-cloud-sdk $HOME/.local/opt
rm -f google-cloud-sdk-362.0.0-linux-x86_64.tar.gz
popd
pushd $HOME/.local/opt/google-cloud-sdk
/usr/bin/env bash -c './install.sh --command-completion --path-update --quiet'
popd
