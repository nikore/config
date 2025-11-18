{ config, pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Noto Serif Display" ];
        sansSerif = [ "Noto Sans Display" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
        emoji = [ "Noto Color Emoji" "Noto Emoji" ];
      };
    };
  };
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
    nerd-font-patcher
    noto-fonts-color-emoji
    noto-fonts
    roboto
    roboto-slab
    roboto-mono
    roboto-serif
    corefonts
    google-fonts
    vista-fonts
    font-awesome
  ];
}
