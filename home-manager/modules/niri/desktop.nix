{ lib, ... }:
{
  xdg.configFile."niri/config.kdl".source = ./desktop_config.kdl;
}
