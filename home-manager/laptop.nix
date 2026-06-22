{ pkgs, ... }:
{
  local.dpi = 106;
  xsession.enable = true;
  pamShim.enable = true;
  imports = [
    ./desktop-common.nix
    ./modules/dms.nix
    ./modules/niri/laptop.nix
  ];
}
