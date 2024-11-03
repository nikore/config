{pkgs, config, ... }:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap pkgs.bitwarden-desktop)
    (config.lib.nixGL.wrap pkgs.google-chrome)
    (config.lib.nixGL.wrap pkgs.darktable)
    (config.lib.nixGL.wrap pkgs.discord)
    (config.lib.nixGL.wrap pkgs.filezilla)
    (config.lib.nixGL.wrap pkgs.gimp)
    (config.lib.nixGL.wrap pkgs.handbrake)
    (config.lib.nixGL.wrap pkgs.heroic-unwrapped)
    (config.lib.nixGL.wrap pkgs.lutris-unwrapped)
    (config.lib.nixGL.wrap pkgs.obs-studio)
    (config.lib.nixGL.wrap pkgs.plexamp)
    (config.lib.nixGL.wrap pkgs.plex-media-player)
    (config.lib.nixGL.wrap pkgs.runelite)
    (config.lib.nixGL.wrap pkgs.signal-desktop)
    (config.lib.nixGL.wrap pkgs.slack)
    (config.lib.nixGL.wrap pkgs.spotify)
    spotifyd
    (config.lib.nixGL.wrap pkgs.standardnotes)
    (config.lib.nixGL.wrap pkgs.vlc)
  ];
}

