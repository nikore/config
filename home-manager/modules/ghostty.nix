{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.ghostty);
    enableZshIntegration = true;
    settings = {
      command = "${pkgs.zsh}/bin/zsh";
      initial-command = "${pkgs.zsh}/bin/zsh";

      background-opacity = 0.95;
      background-blur-radius = 29;

      shell-integration-features = "no-cursor";

      font-family = "monospace";
      font-variation = "wght=100";
      font-feature = [ "cv08" "cv09" "cv10" ];
      font-size = "10";

      cursor-style = "block";
      cursor-style-blink = false;

      theme = "tokyo-night";
      term = "xterm-256color";

      window-theme = "dark";
      window-decoration = false;
    };
    themes = {
      tokyo-night = {
        palette = [
          "0=#1d202f"
          "1=#f7768e"
          "2=#9ece6a"
          "3=#e0af68"
          "4=#7aa2f7"
          "5=#bb9af7"
          "6=#7dcfff"
          "7=#a9b1d6"
          "8=#414868"
          "9=#f7768e"
          "10=#9ece6a"
          "11=#e0af68"
          "12=#7aa2f7"
          "13=#bb9af7"
          "14=#7dcfff"
          "15=#c0caf6"
        ];
        background = "#24283b";
        foreground = "#c0caf5";
        cursor-color = "#c0caf5";
        cursor-text = "#1d202f";
        selection-background = "#364a82";
        selection-foreground = "#c0caf5";
      };
    };
  };
}
