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
    ./modules/brave.nix
    ./modules/desktop_packages.nix
    ./modules/ghostty.nix
    ./modules/gtk.nix
    ./modules/halloy.nix
    ./modules/mouse.nix
    ./modules/rofi.nix
    ./modules/polybar.nix
    ./modules/dunst.nix
    ./modules/zen.nix
    ./modules/radio-cli.nix
    ./modules/vscode.nix
  ];
}
