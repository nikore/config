{ pkgs, ...}:

{
  home.packages = with pkgs; [
    polybar
  ];
  
  home.file = {
    ".config/polybar" = {
      source = ../modules/polybar;
      recursive = true;
    };
  };
}
