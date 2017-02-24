#!/bin/bash

if [ "$1" == "-r" ]; then
    # Install rust
    curl https://sh.rustup.rs -sSf | sh
    source ~/.cargo/env
fi

cd ~/src_root
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
cargo build --release
cp target/release/rg ~/bin/
rg --version
