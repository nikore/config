{ pkgs, ...}:
let
  macchiato = {
    rosewater = "#f4dbd6";
    flamingo = "#f0c6c6";
    pink = "#f5bde6";
    mauve = "#c6a0f6";
    red = "#ed8796";
    maroon = "#ee99a0";
    peach = "#f5a97f";
    yellow = "#eed49f";
    green = "#a6da95";
    teal = "#8bd5ca";
    sky = "#91d7e3";
    sapphire = "#7dc4e4";
    blue = "#8aadf4";
    lavender = "#b7bdf8";
    text = "#cad3f5";
    subtext1 = "#b8c0e0";
    subtext0 = "#a5adcb";
    overlay2 = "#939ab7";
    overlay1 = "#8087a2";
    overlay0 = "#6e738d";
    surface2 = "#5b6078";
    surface1 = "#494d64";
    surface0 = "#363a4f";
    base = "#24273a";
    mantle = "#1e2030";
    crust = "#181926";
    transparent = "#FF00000";
  };
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      githubSupport = true;
      mpdSupport = true;
      pulseSupport = true;
      i3Support = true;
    };
    script = "";

    settings = {
      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
        
      "global/wm" = {
        margin-top = 0;
        margin-bottom = 0;
      };

      "bar/primary-top" = {
        width = "100%";
        height = "20pt";
        radius = 0;
        dpi = 100;
        background = "${macchiato.base}";
        foregruond = "${macchiato.surface0}";
        border-size = "3pt";
        border-color = "${macchiato.crust}";
        module-margin = 0;
        padding-left = "4pt";
        padding-right = "4pt";
        separator = " ";
        separator-forground = "${macchiato.base}";
        font-0 = "Roboto condensed:size=11:weight=bold;2";
        font-1 = "Font Awesome 6 Free:pixelsize=11;2";
        font-2 = "Font Awesome 6 Free Solid:pixelsize=11;2";
        font-3 = "Font Awesome 6 Brands:pixelsize=11;2";
        font-4 = "JetBrainsMono Nerd Font Mono:size=24:weight=bold;5";
        font-5 = "Noto Sans Bengali:size=11:weight=bold;1";
        font-6 = "Noto Sans JP:size=11:weight=bold;1";
        font-7 = "Noto Sans Arabic:size=11:weight=bold;1";
        modules-left = "rofi i3 xwindow"; 
        modules-center = "time";
        modules-right = "filesystem cpu temp memory pulseaudio tray";
        cursor-click = "pointer";
        enable-ipc = "true";
        wm-restack = "i3";
      };

      "module/rofi" = {
        type = "custom/text";
        content = "󰋜";
        content-padding = 3;
        click-left = "exec rofi -show drun -disable-history -show-icons";
        click-right = "exec ~/.config/custom_scripts/power.sh";
        content-foreground = "${macchiato.peach}";
        content-background = "${macchiato.base}";
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = false;
        enable-scroll = false;
        show-urgent = true;
        strip-wsnumbers = true;
        index-sort = true;
        enable-click = true;
        fuzzy-match = true;
        ws-icon-0 = "1;";
        ws-icon-1 = "2;";
        ws-icon-2 = "3;󰈹";
        ws-icon-3 = "4;";
        ws-icon-4 = "5;󰚀";
        ws-icon-5 = "6;";
        ws-icon-6 = "7;󰭛";
        ws-icon-7 = "8;󱓷";
        ws-icon-8 = "9;";
        ws-icon-default = "󰚀";
        format = "<label-state> <label-mode>";
        label-mode = "%mode%";
        label-mode-padding = 1;
        label-mode-background = "${macchiato.red}";
        label-mode-foreground = "${macchiato.text}";
        label-focused = "%icon%";
        label-focused-font = 5;
        label-focused-foreground = "${macchiato.mauve}";
        label-focused-background= "${macchiato.base}";
        label-focused-padding = 2;
        label-unfocused = "%icon%";
        label-unfocused-font = 5;
        label-unfocused-foreground = "${macchiato.text}";
        label-unfocused-background= "${macchiato.base}";
        label-unfocused-padding = 2;
        label-visible = "%icon%";
        label-visible-padding = 2;
        label-urgent = "%icon%";
        label-urgent-font = 5;
        label-urgent-foreground = "${macchiato.red}";
        label-urgent-background = "${macchiato.base}";
        label-urgent-padding = 2;
        label-separator = "|";
        label-separator-padding = 2;
        label-separator-foreground = "${macchiato.base}";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        format-prefix = "      ";
        format-prefix-foreground = "${macchiato.mauve}";
        format-prefix-background = "${macchiato.base}";
        label = "%class%";
        label-maxlen = 60;
        label-foreground = "${macchiato.text}";
        label-background = "${macchiato.base}";
        label-padding-left = 2;
        label-padding-right = 2;
      };

      "module/time" = {
        type = "internal/date";
        interval = 1;
        format-prefix = "      ";
        format-prefix-foreground = "${macchiato.blue}";
        format-prefix-background = "${macchiato.base}";
        date = "%A  %d %b %Y | %H:%M:%S";
        label = "%date%";
        label-foreground = "${macchiato.text}";
        label-background = "${macchiato.base}";
        label-padding-left = 2;
        label-padding-right = 2;
      };

      "module/filesystem" = {
        type = "internal/fs";
        interval = 2;
        mount-0 = "/";
        format-mounted-prefix = "      ";
        format-mounted-prefix-foreground = "${macchiato.red}";
        format-mounted-prefix-background= "${macchiato.base}";
        label-mounted = "%free%";
        label-unmounted = "%mountpoint% not mounted";
        label-mounted-foreground = "${macchiato.text}";
        label-mounted-background= "${macchiato.base}";
        label-mounted-padding-left = 2;
        label-mounted-padding-right = 2;
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 1;
        format-prefix = "      ";
        format-prefix-foreground = "${macchiato.peach}";
        format-prefix-background= "${macchiato.base}";
        label = "%percentage%%";
        label-foreground = "${macchiato.text}";
        label-background= "${macchiato.base}";
        label-padding-left = 2;
        label-padding-right = 2;
      };

      "module/temp" = {
        type = "internal/temperature";
        interval = 0.5;
        thermal-zone = 0;
        hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
        base-temperature = 40;
        warn-temperature = 70;
        units = true;
        format = "<label>";
        format-prefix = "        ";
        format-prefix-foreground= "${macchiato.yellow}";
        format-prefix-background= "${macchiato.base}";
        label = "%temperature-c%";
        label-foreground = "${macchiato.text}";
        label-background= "${macchiato.base}";
        label-padding-left = 2;
        label-padding-right = 2;
        format-warn-prefix = "        ";
        format-warn-prefix-foreground = "${macchiato.text}";
        format-warn-prefix-background = "${macchiato.red}";
        label-warn = "%temperature-c%";
        label-warn-foreground = "${macchiato.text}";
        label-warn-background = "${macchiato.red}";
        label-warn-padding-left = 2;
        label-warn-padding-right = 2;
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 1;
        format-prefix = "      ";
        format-prefix-foreground = "${macchiato.blue}";
        format-prefix-background= "${macchiato.base}";
        label = "%mb_used%";
        label-foreground = "${macchiato.text}";
        label-background= "${macchiato.base}";
        label-padding-left=2;
        label-padding-right=2;
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        format-volume-prefix = "     ";
        format-volume-prefix-foreground = "${macchiato.blue}";
        format-volume-prefix-background= "${macchiato.base}";
        format-volume = "<label-volume>";
        label-volume = "%percentage%%";
        label-volume-foreground= "${macchiato.text}";
        label-volume-background= "${macchiato.base}";
        label-volume-padding-left = 2;
        label-volume-padding-right = 2;
        format-muted-prefix = "  󰝟   ";
        format-muted-foreground = "${macchiato.red}";
        format-muted-background = "${macchiato.base}";
        label-muted = "muted";
        label-muted-foreground = "${macchiato.red}";
        label-muted-background = "${macchiato.base}";
        label-muted-padding = 2;
      };

      "module/tray" = {
        type = "internal/tray";
        format = "<tray>";
        format-prefix = " 󱊖   ";
        format-prefix-foreground = "${macchiato.sky}";
        format-prefix-background = "${macchiato.base}";
        tray-spacing= "8px";
        format-padding="5px";
        format-background="${macchiato.base}";
        tray-background = "${macchiato.base}";
      };

      "module/battery" = {
        type = "internal/battery";
        full-at = 99;
        low-at = 15;
        battery = "BAT0";
        adapter = "ADP1";
        poll-interval = 5;
        time-format = "%H:%M";
        format-charging = "<animation-charging><label-charging>";
        format-charging-foreground = "${macchiato.green}";
        format-charging-background = "${macchiato.base}";
        label-charging = "%percentage%%";
        label-charging-foreground = "${macchiato.text}";
        label-charging-background = "${macchiato.base}";
        label-charging-padding= 2;
        format-discharging = "<ramp-capacity><label-discharging>";
        format-discharging-foreground = "${macchiato.teal}";
        format-discharging-background = "${macchiato.base}";
        label-discharging = "%percentage%%";
        label-discharging-foreground = "${macchiato.text}";
        label-discharging-background = "${macchiato.base}";
        label-discharging-padding= 2;
        format-full-prefix = "      ";
        format-full-foreground = "${macchiato.sapphire}";
        format-full-background = "${macchiato.base}";
        label-full = "%percentage%%";
        label-full-foreground = "${macchiato.text}";
        label-full-background = "${macchiato.base}";
        label-full-padding = 2;
        label-low = "[  BATTERY LOW ] %percentage%%";
        label-low-foreground = "${macchiato.base}";
        label-low-background = "${macchiato.red}";
        label-low-padding = 2;
        ramp-capacity-0 ="     ";
        ramp-capacity-1 ="     ";
        ramp-capacity-2 ="     ";
        ramp-capacity-3 ="     ";
        ramp-capacity-4 ="     ";
        ramp-capacity-0-padding = 3;
        ramp-capacity-1-padding = 3;
        ramp-capacity-2-padding = 3;
        ramp-capacity-3-padding = 3;
        ramp-capacity-4-padding = 3;
        ramp-capacity-0-foreground = "${macchiato.red}";
        ramp-capacity-1-foreground = "${macchiato.green}";
        ramp-capacity-2-foreground = "${macchiato.green}";
        ramp-capacity-3-foreground = "${macchiato.green}";
        ramp-capacity-4-foreground = "${macchiato.green}";
        ramp-capacity-0-background = "${macchiato.base}";
        ramp-capacity-1-background = "${macchiato.base}";
        ramp-capacity-2-background = "${macchiato.base}";
        ramp-capacity-3-background = "${macchiato.base}";
        ramp-capacity-4-background = "${macchiato.base}";
        bar-capacity-width = 10;
        animation-charging-0 ="     ";
        animation-charging-1 ="     ";
        animation-charging-2 ="     ";
        animation-charging-3 ="     ";
        animation-charging-4 ="     ";
        animation-charging-framerate = 750;
      };

      "module/backlight" = {
        type = "internal/backlight";
        card = "intel_backlight";
        use-actual-brightness = true;
        enable-scroll = true;
        format = "<label>";
        format-prefix = "        ";
        format-prefix-foreground = "${macchiato.yellow}";
        format-prefix-background = "${macchiato.base}";
        format-padding-left = 2;
        format-padding-right = 2;
        label = "%percentage%%";
        label-foreground = "${macchiato.text}";
        label-background = "${macchiato.base}";
        label-padding-left = 2;
        label-padding-right = 2;
      };
    };
  };
}
