{ inputs, pkgs, ... }:
{
  imports = [
    ./mangohud.nix
    ./openlinkhub.nix
    ./openrgb.nix
  ];
  home.packages = with pkgs; [
    bottles
    heroic
    vulkan-tools
    gpu-viewer
    melonds
    bolt-launcher
    runelite
    inputs.lightforge.packages.${pkgs.system}.lightforge
  ];
}
