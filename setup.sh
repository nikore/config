#!/bin/bash

# Install tools
sudo pacman -Sy --needed git jq tmux zsh curl mtr git-delta flatpak libpamac-flatpak-plugin lazygit

# Setup flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Flatpak Apps
flatpak install flathub com.brave.Browser
flatpak install flathub org.videolan.VLC
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.spotify.Client
flatpak install flathub com.visualstudio.code
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.obsproject.Studio
flatpak install flathub net.lutris.Lutris
flatpak install flathub com.bitwarden.desktop
flatpak install flathub org.signal.Signal
flatpak install flathub fr.handbrake.ghb
flatpak install flathub com.slack.Slack
flatpak install flathub org.filezillaproject.Filezilla
flatpak install flathub com.transmissionbt.Transmission
flatpak install flathub tv.plex.PlexDesktop
flatpak install flathub org.standardnotes.standardnotes

if [ ! -d "$(HOME)/bin" ]; then
    mkdir $(HOME)/bin
fi

cd $(HOME)/bin

# Install jetbrains toolbox
curl https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.3.0.30876.tar.gz -o - | tar -xz
mv jetbrains-toolbox-2.3.0.30876/jetbrains-toolbox jetbrains-toolbox
chmod +x jetbrains-toolbox
rm -rf jetbrains-toolbox-2.3.0.30876

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x kind

# Install helm
curl https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz -o - | tar -xz
mv linux-amd64/helm helm
rm -rf linux-amd64

# Install lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | DIR=$(HOME)/bin bash
