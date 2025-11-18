{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    google-fonts
    liberation_ttf_v1
    helvetica-neue-lt-std
    noto-fonts-cjk-sans-static
    noto-fonts-color-emoji
    noto-fonts
    dejavu_fonts
    cantarell-fonts
    source-sans
    montserrat
    comfortaa
  ];
}
