{pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMonoNL Nerd Font 24";
    terminal = "${pkgs.ghostty}/bin/ghostty";
    extraConfig = {
        modi = "calc,emoji,ssh,window,drun,run";
        case-sensitive = false;
        sidebar-mode = true;
    };
    plugins = [
      pkgs.rofi-calc
      pkgs.rofi-emoji
    ];
    theme = ./rofi/catppuccin-macchiato.rasi;
  }; 
}
