#!/bin/zsh

func macOS() {
    # Command Line Tools
    which -s xcode-select
    if [[ $? != 0 ]] ; then
        xcode-select --install
    else
        echo "Command Line Tools already installed"
    fi

    # Show task switcher on all monitors.
    defaults write com.apple.Dock appswitcher-all-displays -bool true
    killall Dock
}

func linux() {
    # Install tools
    sudo pacman -Sy --needed git jq yq zsh curl mtr git-delta flatpak libpamac-flatpak-plugin ripgrep base-devel

    # Setup flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
    macOS
fi

