{pkgs, config, ... }:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap _1password-gui)
    clipit
    (config.lib.nixGL.wrap google-chrome)
    (config.lib.nixGL.wrap darktable)
    (config.lib.nixGL.wrap discord)
    (config.lib.nixGL.wrap dropbox-cli)
    (config.lib.nixGL.wrap filezilla)
    (config.lib.nixGL.wrap gimp)
    (config.lib.nixGL.wrap handbrake)
    i3-auto-layout
    (config.lib.nixGL.wrap obs-studio)
    (config.lib.nixGL.wrap plexamp)
    (config.lib.nixGL.wrap plex-desktop)
    protonvpn-cli
    (config.lib.nixGL.wrap proton-authenticator)
    (config.lib.nixGL.wrap protonmail-desktop)
    (config.lib.nixGL.wrap signal-desktop)
    (config.lib.nixGL.wrap slack)
    (config.lib.nixGL.wrap spotify)
    spotifyd
    (config.lib.nixGL.wrap flameshot)
    (config.lib.nixGL.wrap standardnotes)
    (config.lib.nixGL.wrap vlc)
    (config.lib.nixGL.wrap zoom-us)
    feh
  ];
}

