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
    vlc
    zoom-us
    lmstudio
    feh
    protonup-rs
    jetbrains-toolbox
  ];

  programs.google-chrome = {
    enable = true;
    package = pkgs.google-chrome;
    commandLineArgs = [ "--ozone-platform=x11" ];
  };
}
