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
    (config.lib.nixGL.wrap heroic)
    i3-auto-layout
    (config.lib.nixGL.wrap lutris)
    (config.lib.nixGL.wrap obs-studio)
    (config.lib.nixGL.wrap plexamp)
    (config.lib.nixGL.wrap plex-media-player)
    (config.lib.nixGL.wrap runelite)
    (config.lib.nixGL.wrap signal-desktop)
    (config.lib.nixGL.wrap slack)
    (config.lib.nixGL.wrap spotify)
    spotifyd
    (config.lib.nixGL.wrap standardnotes)
    (config.lib.nixGL.wrap vlc)
    (config.lib.nixGL.wrap zoom-us)
  ];
}

