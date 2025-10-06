{pkgs, config, ... }:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap bottles)
    gamemode
    (config.lib.nixGL.wrap heroic)
    (config.lib.nixGL.wrap lutris)
    (config.lib.nixGL.wrap mangohud)
    (config.lib.nixGL.wrap runelite)
    protonup-rs
    (config.lib.nixGL.wrap steam)
  ];
}
