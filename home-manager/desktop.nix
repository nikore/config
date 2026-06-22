{ inputs, ... }:
{
  local.dpi = 96;
  xsession.enable = true;
  imports = [
    ./desktop-common.nix
    ./modules/dms.nix
    ./modules/openrgb.nix
    ./modules/niri/desktop.nix
  ];
}
