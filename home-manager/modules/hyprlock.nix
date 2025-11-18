{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.hyprlock = {
    enable = true;
    package = pkgs.emptyDirectory;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = false;
        no_fade_in = false;
        no_fade_out = false;
        ignore_empty_input = false;
      };
    };
  };
}
