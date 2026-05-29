{
  inputs,
  pkgs,
  lib,
  host,
  ...
}:
{
  xdg.configFile."hypr/myHyprConfig.lua".source = ./hypr/hyprland.lua;
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    configType = "lua";
    settings = {
      cfg._var = lib.generators.mkLuaInline "require('myHyprConfig')";
    };
  };
}
