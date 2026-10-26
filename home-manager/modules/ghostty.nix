{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      command = "${pkgs.zsh}/bin/zsh";
      initial-command = "${pkgs.zsh}/bin/zsh";
      maximize = true;

      background-opacity = 0.95;
      background-blur-radius = 29;

      shell-integration-features = "no-cursor";
      copy-on-select = "clipboard";
      shell-integration = "detect";
      mouse-hide-while-typing = true;

      font-size = "12";

      cursor-style = "block";
      cursor-style-blink = false;

      term = "xterm-256color";

      window-theme = "dark";
      window-decoration = false;
    };
  };
}
