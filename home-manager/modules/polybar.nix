{ pkgs, ...}:

{
  home.packages = with pkgs; [
    (pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3Support = true;
    })
  ];
  
  home.file = {
    ".config/polybar" = {
      source = ../modules/polybar;
      recursive = true;
    };
  };
}
