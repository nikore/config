{ config, pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Serif Display"
          "Noto Color Emoji"
          "Noto Emoji"
        ];
        sansSerif = [
          "Noto Sans Display"
          "Noto Color Emoji"
          "Noto Emoji"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
          "Noto Emoji"
        ];
        emoji = [
          "Noto Color Emoji"
          "Noto Emoji"
        ];
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
    corefonts
    google-fonts
    vista-fonts
    font-awesome
  ];
}
