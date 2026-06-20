{ lib, ... }: {
  xdg.configFile."niri/config.kdl".source = ./niri_config.kdl;
}
