{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    _1password-gui
    cliphist
    darktable
    discord
    dropbox-cli
    dconf
    filezilla
    gimp
    handbrake
    pavucontrol
    playerctl
    plexamp
    plex-desktop
    proton-vpn
    proton-authenticator
    protonmail-desktop
    signal-desktop
    slack
    spotify
    spotifyd
    standardnotes
    tailscale
    vlc
    zoom-us
    lmstudio
    feh
    jetbrains-toolbox
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  programs.google-chrome = {
    enable = true;
    package = pkgs.google-chrome;
  };
}
