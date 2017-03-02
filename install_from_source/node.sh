#!/bin/sh

sudo apt-get install -y build-essential checkinstall
sudo apt-get install -y libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash 
. ~/.bashrc
nvm install node
