{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    wofi-emoji
  ];
  programs.wofi = {
    enable = true;
    settings = {
      width = "30%";
    };
    style = ''
      #text { margin-left: 5px; margin-right: 5px; }
    '';
  };
}
