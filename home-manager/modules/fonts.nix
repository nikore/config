{ config, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Noto Serif"
      ];
      sansSerif = [
        "Noto Sans"
      ];
      monospace = [
        "JetBrainsMonoNL Nerd Font"
      ];
      emoji = [ 
        "Noto Color Emoji"
        "Noto Emoji"
      ];
    };
  };
}
