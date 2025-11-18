{ inputs, ... }: {
  xsession.enable = true;
  imports = [
    ./modules/brave.nix
    ./modules/desktop_packages.nix
    ./modules/ghostty.nix
    ./modules/gtk.nix
    ./modules/halloy.nix
    ./modules/mouse.nix
    ./modules/rofi.nix
    ./modules/dunst.nix
    ./modules/openrgb.nix
    ./modules/zen.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/hyprlock.nix
    ./modules/wlogout.nix
    ./modules/hyprpaper.nix
    ./modules/radio-cli.nix
    ./modules/vscode.nix
  ];
}
