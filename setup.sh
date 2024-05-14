#!/bin/zsh

export SCRIPT_DIR=${0:a:h}

# Install tools
sudo pacman -Sy --needed git go jq yq tmux zsh curl mtr git-delta flatpak libpamac-flatpak-plugin lazygit neovim ripgrep

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

if [ ! -d "${HOME}/.oh-my-zsh/" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "${HOME}/bin" ]; then
    mkdir ${HOME}/bin
fi

cd ${HOME}/bin

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -yq

# Install Go
if [ ! -d "${HOME}/.go" ]; then
    mkdir ${HOME}/.go
fi
echo "Install GoLang..."
curl -L "https://go.dev/dl/go1.22.3.linux-amd64.tar.gz" -o - | tar -xz --strip-components=1 -C ${HOME}/.go

# install Alacritty
echo "Installing Alacritty..."
${HOME}/.cargo/bin/cargo install alacritty

# Install Spotify-tui
echo "Installing Spotify-tui..."
${HOME}/.cargo/bin/cargo install spotify-tui

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl

# Install kubectx
echo "Installing kubectx..."
curl -L "https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx_v0.9.5_linux_x86_64.tar.gz" -o - | tar -xz
chmod +x kubectx

# Install k9s
echo "Installing k9s..."
curl -L "https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz" -o - | tar -xz 
chmod +x k9s
rm -rf LICENSE README.md

# Install kind
echo "Instaling kind..."
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64"
chmod +x kind

# Install helm
echo "Installing helm..."
curl "https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz" -o - | tar -xz --strip-components=1
chmod +x helm

# Install Jira CLI
echo "Installing jira..."
curl -Lo ./jira "https://github.com/go-jira/jira/releases/download/v1.0.27/jira-linux-amd64"
chmod +x jira

# Install lazydocker
echo "Installing lazydocker..."
curl "https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh" | DIR=${HOME}/bin bash

# Install pbtools
ln -svfF "${SCRIPT_DIR}/bin/pbcopy" "${HOME}/bin/pbcopy"
ln -svfF "${SCRIPT_DIR}/bin/pbpaste" "${HOME}/bin/pbpaste"

# Symlink config files
ln -svfF "${SCRIPT_DIR}/dotfiles/zshrc" "${HOME}/.zshrc"
ln -svfF "${SCRIPT_DIR}/dotfiles/tmux.conf" "${HOME}/.tmux.conf"
ln -svfF "${SCRIPT_DIR}/dotfiles/alacritty.toml" "${HOME}/.alacritty.toml"

