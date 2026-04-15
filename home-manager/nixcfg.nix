{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimnetal-features = nix-command flakes
    '';
  };
}
