{pkgs, config, ... }:
{
  home.packages = with pkgs; [
    openrgb-with-all-plugins
    openrgb-plugin-effects
    openrgb-plugin-hardwaresync
  ];
}
