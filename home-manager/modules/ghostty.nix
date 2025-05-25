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

      #font-family = "JetBrainsMonoNL Nerd Font Mono";
      font-variation = "wght=100";
      font-feature = [ "cv08" "cv09" "cv10" ];
      font-size = "10";

      cursor-style = "block";
      cursor-style-blink = false;

      theme = "catppuccin-macchiato";
      term = "xterm-256color";

      window-theme = "dark";
      window-decoration = false;
    };
    themes = {
      catppuccin-macchiato = {
        palette = [
         "0=#494d64"
          "1=#ed8796"
          "2=#a6da95"
          "3=#eed49f"
          "4=#8aadf4"
          "5=#f5bde6"
          "6=#8bd5ca"
          "7=#b8c0e0"
          "8=#5b6078"
          "9=#ed8796"
          "10=#a6da95"
          "11=#eed49f"
          "12=#8aadf4"
          "13=#f5bde6"
          "14=#8bd5ca"
          "15=#a5adcb"
        ];
        background = "#24273a";
        foreground = "#cad3f5";
        cursor-color = "#f4dbd6";
        cursor-text = "#24273a";
        selection-background = "#3a3e53";
        selection-foreground = "#cad3f5";
      };
    };
  };
}
