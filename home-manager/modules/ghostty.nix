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

      font-variation = "wght=100";
      font-feature = [ "cv08" "cv09" "cv10" ];
      font-size = "10";

      cursor-style = "block";
      cursor-style-blink = false;

      term = "xterm-256color";

      window-theme = "dark";
      window-decoration = false;
    };
  };
}
