{ config, pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Serif Display"
        ];
        sansSerif = [
          "Noto Sans Display"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
        ];
        emoji = [ 
          "Noto Color Emoji"
          "Noto Emoji"
        ];
      };
    };
  };
}
