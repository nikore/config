{ inputs, pkgs, ... }:
{
  local.dpi = 106;
  xsession.enable = true;

  targets.genericLinux.nixGL = {
    packages = inputs.nixGL.packages;
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
    vulkan.enable = true;
  };

  imports = [
    ./desktop-common.nix
    ./modules/rofi.nix
    ./modules/polybar.nix
    ./modules/dunst.nix
  ];
}
