{ inputs, ... }:
{
  local.dpi = 96;
  xsession.enable = true;
  imports = [
    ./desktop-common.nix
    ./modules/dms.nix
    ./modules/gaming_packages.nix
    ./modules/niri/desktop.nix
  ];
}
