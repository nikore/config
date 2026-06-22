{ lib, ... }:
{
  xdg.configFile."niri/config.kdl".source = ./laptop_config.kdl;
}
