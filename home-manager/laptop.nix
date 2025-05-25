{
  inputs,
  ...
}: {
  xsession.enable = true;

  nixGL.packages = inputs.nixGL.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [
    "mesa"
  ];
  nixGL.vulkan.enable = true;

  imports = [
    ./modules/brave.nix
    ./modules/desktop_packages.nix
    ./modules/ghostty.nix
    ./modules/gtk.nix
    ./modules/mouse.nix
    ./modules/rofi.nix
    ./modules/polybar.nix
    ./modules/dunst.nix
  ];
}
