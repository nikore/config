#!/bin/zsh

echo "Installing core tools and prep work..."
source setup/prep.sh

echo "Installing homebrew..."
source setup/homebrew.sh

echo "Installing common packages..."
source setup/common.sh

echo "Installing rust..."
source setup/rust.sh

echo "Installing applications..."
source setup/applications.sh

export SCRIPT_DIR=${0:a:h}

echo "Installing dotfiles..."
source setup/dotfiles.sh
