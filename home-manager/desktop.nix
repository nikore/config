{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alacritty
    bitwarden-desktop
    brave
    darktable
    discord
    filezilla
    firefox-unwrapped
    gimp
    google-chrome
    handbrake
    heroic-unwrapped
    lutris-unwrapped
    obs-studio
    plexamp
    plex-media-player
    signal-desktop
    slack
    spotify
    spotifyd
    standardnotes
    vlc
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      "colors" = {
        "bright" = {
          "black" = "#414868";
          "blue" = "#7aa2f7";
          "cyan" = "#7dcfff";
          "green" = "#9ece6a";
          "magenta" = "#bb9af7";
          "red" = "#f7768e";
          "white" = "#c0caf5";
          "yellow" = "#e0af68";
        };
        "indexed_colors" = [
          {
            "color" = "#ff9e64";
            "index" = 16;
          }
          {
            "color" = "#db4b4b";
            "index" = 17;
          }
        ];
        "normal" = {
          "black" = "#1d202f";
          "blue" = "#7aa2f7";
          "cyan" = "#7dcfff";
          "green" = "#9ece6a";
          "magenta" = "#bb9af7";
          "red" = "#f7768e";
          "white" = "#a9b1d6";
          "yellow" = "#e0af68";
        };
        "primary" = {
          "background" = "#24283b";
          "foreground" = "#c0caf5";
        };
      };
      "env" = {
        "TERM" = "xterm-256color";
      };
      "font" = {
        "normal" = {
          "family" = "JetBrainsMonoNL Nerd Font";
        };
      };
      "live_config_reload" = true;
      "window" = {
        "blur" = true;
        "decorations_theme_variant" = "Dark";
        "dynamic_title" = true;
        "opacity" = 0.95;
        "startup_mode" = "Maximized";
      };
    };
  };
}
