#!/bin/zsh

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

# Install Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ln -svfF "${SCRIPT_DIR}/dotfiles/zprofile" "${HOME}/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    brew update
fi

# CLI
brew install bat
brew install bottom
brew install coreutils
brew install curl
brew install git-delta
brew install fd
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install fzy
brew install go
brew install htop
brew install jq
brew install k9s
brew install kubectl
brew install kubectx
brew install lazydocker
brew install lazygit
brew install lsd
brew install lua
brew install neovim
brew install ripgrep
brew install sk
brew install tmate
brew install tmux
brew install tmuxinator
brew install ttyrec
brew install wget
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-vi-mode

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-caskaydia-mono-nerd-font
brew install --cask font-fira-code-nerd-font
brew install --cask font-gohufont-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask homebrew/cask-fonts/font-meslo-lg-nerd-font
brew install --cask font-sauce-code-pro-nerd-font
brew install --cask font-terminess-ttf-nerd-font
brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized
brew install --cask font-sf-mono-nerd-font-ligaturized

# Applications
brew install --cask alacritty
brew install --cask docker
brew install --cask karabiner-elements
brew install --cask obsidian
brew install --cask shifty
brew install --cask topnotch
brew install --cask blackhole-2ch

if [ ! -d "$(HOME)/bin" ]; then
    mkdir $(HOME)/bin
fi
