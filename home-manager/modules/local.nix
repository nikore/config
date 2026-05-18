{ lib, ... }:
{
  options.local = {
    dpi = lib.mkOption {
      type = lib.types.int;
      default = 96;
      example = 144;
      description = ''
        DPI used for X server settings (xresources Xft.dpi and
        xsettingsd Xft/dpi). Set per-host in desktop.nix / laptop.nix.
      '';
    };
  };
}
