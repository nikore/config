#!/bin/zsh

func macOS() {
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
}


func linux() {
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

    ${HOME}/.cargo/bin/cargo install alacritty
}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
    macOS
fi

