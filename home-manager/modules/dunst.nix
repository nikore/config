{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    package = pkgs.emptyDirectory;

    iconTheme = {
      name = "Numix-Circle";
      package = pkgs.numix-icon-theme-circle;
    };

    settings = {
      global = {
        monitor = 1;
        follow = "none";
        width = 300;
        origin = "top-right";
        offset = "10x50";
        scale = 0;
        transparency = 0;
        frame_width = 2;
        font = "JetBrainMonoNL Nerd Font 11";
        frame_color = "#8aadf4";
        highlight = "#8aadf4";
        separator_color = "frame";
      };
      urgency_low = {
        background = "#24273a";
        foreground = "#cad3f5";
      };
      urgency_normal = {
        background = "#24273a";
        foreground = "#cad3f5";
      };
      urgency_critical = {
        background = "#24273a";
        foreground = "#cad3f5";
        frame_color = "#f5a97f";
      };
    };
  };
}
