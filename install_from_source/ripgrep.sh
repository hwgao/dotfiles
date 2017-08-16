#!/bin/bash

if [ ! -f ~/.cargo/env ]; then
    # Install rust
    curl https://sh.rustup.rs -sSf | sh
    source ~/.cargo/env
fi

. ./git-lastest-tag https://github.com/BurntSushi/ripgrep ~/src_root -i
cargo build --release
cp target/release/rg ~/bin/
rg --version
