{ config, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Ubuntu"
        "Noto Color Emoji"
        "Noto Emoji"
      ];
      sansSerif = [
        "Ubuntu"
        "Noto Color Emoji"
        "Noto Emoji"
      ];
      monospace = [
        "JetBrainsMonoNL Nerd Font"
        "Noto Color Emoji"
        "Noto Emoji"
      ];
      emoji = [ 
        "Noto Color Emoji"
        "Noto Emoji"
      ];
    };
  };
}
