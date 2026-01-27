{ inputs, ... }: {
  xsession.enable = true;
  imports = [
    ./modules/brave.nix
    ./modules/desktop_packages.nix
    ./modules/dms.nix
    ./modules/ghostty.nix
    ./modules/gtk.nix
    ./modules/halloy.nix
    ./modules/mouse.nix
    ./modules/openrgb.nix
    ./modules/zen.nix
    ./modules/hyprland.nix
    ./modules/radio-cli.nix
    ./modules/vscode.nix
  ];
}
