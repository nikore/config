{ inputs, pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    settings = {
      # Disabled: caused repeated store corruption on this XFS host where
      # paths got hardlinked into /nix/store/.links but the user-visible path
      # vanished, leaving the DB thinking the path was valid while disk had nothing.
      # Symptom: wuffs.drv (and other FOD-consuming builds) failed with
      # "FileNotFound" even after successful substitute. See git log for details.
      auto-optimise-store = false;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      download-buffer-size = 524288000;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [ inputs.nur.overlays.default ];
  };
}
