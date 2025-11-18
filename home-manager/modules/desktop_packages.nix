{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap _1password-gui)
    cliphist
    (config.lib.nixGL.wrap darktable)
    (config.lib.nixGL.wrap discord)
    (config.lib.nixGL.wrap dropbox-cli)
    dconf
    (config.lib.nixGL.wrap filezilla)
    (config.lib.nixGL.wrap gimp)
    (config.lib.nixGL.wrap handbrake)
    (config.lib.nixGL.wrap obs-studio)
    (config.lib.nixGL.wrap plexamp)
    (config.lib.nixGL.wrap plex-desktop)
    #    (config.lib.nixGL.wrap protonvpn-gui)
    (config.lib.nixGL.wrap proton-authenticator)
    (config.lib.nixGL.wrap protonmail-desktop)
    (config.lib.nixGL.wrap signal-desktop)
    (config.lib.nixGL.wrap slack)
    (config.lib.nixGL.wrap spotify)
    spotifyd
    (config.lib.nixGL.wrap standardnotes)
    (config.lib.nixGL.wrap vlc)
    (config.lib.nixGL.wrap zoom-us)
    (config.lib.nixGL.wrap lmstudio)
    feh
    protonup-rs
    (config.lib.nixGL.wrap jetbrains-toolbox)
  ];

  programs.google-chrome = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.google-chrome);
    commandLineArgs = [ "--ozone-platform=x11" ];
  };
}
