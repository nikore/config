{pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMonoNL Nerd Font 24";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    extraConfig = {
        modi = "calc,emoji,ssh,window,drun,run";
        case-sensitive = false;
        sidebar-mode = true;
    };
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
    theme = ./rofi/Arc-Dark.rasi;
  }; 
}
