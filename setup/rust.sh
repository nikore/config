#/bin/zsh

brew install rustup

rustup override set stable
rustup update stable
rustup component add rust-analyzer

