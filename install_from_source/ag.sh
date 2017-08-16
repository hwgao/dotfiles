#!/bin/bash

SRC_ROOT=~/src_root
NAME="the_silver_searcher"


###ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
cd ${SRC_ROOT}
if [ ! -d "${NAME}" ]; then
    git clone https://github.com/ggreer/the_silver_searcher.git
    cd "${NAME}"
else
    cd "${NAME}"

    # Get new tags from remote
    git fetch --tags
fi

# Get latest tag name
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)

# Checkout latest tag
git checkout $latestTag

./build.sh
sudo apt-get remove -y silversearcher-ag
sudo make install


