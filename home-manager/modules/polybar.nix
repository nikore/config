{ pkgs, ...}:
let
  gruvbox = {
    black = "#000000";
    dark = "#1d1d1d";
    disabled = "#262626";
    red = "#ea6962";
    red-alt = "#b22222";
    orange = "#fe8019";
    orange-mat = "#e78a4e";
    yellow = "#fabd2f";
    yellow-mat = "#d8a657";
    green = "#b8bb26";
    green-alt = "#98971a";
    aqua = "#8ec07c";
    aqua-alt = "#689d6a";
    blue = "#458588";
    blue-alt = "#83a598";
    grey = "#313131";
    dark-grey = "#222222";
    cream = "#fff4d2";
    white = "#FFFFFF";
    transparent = "#00000000";
    Stransparent = "#CC000000";
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
        background = "${gruvbox.black}";
        foregruond = "${gruvbox.cream}";
        border-size = "3pt";
        border-color = "${gruvbox.black}";
        module-margin = 0;
        padding-left = "4pt";
        padding-right = "4pt";
        separator = " ";
        separator-forground = "${gruvbox.black}";
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
        content-foreground = "${gruvbox.orange}";
        content-background = "${gruvbox.black}";
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
        label-mode-background = "${gruvbox.red-alt}";
        label-mode-foreground = "${gruvbox.white}";
        label-focused = "%icon%";
        label-focused-font = 5;
        label-focused-foreground = "${gruvbox.yellow}";
        label-focused-background= "${gruvbox.black}";
        label-focused-padding = 2;
        label-unfocused = "%icon%";
        label-unfocused-font = 5;
        label-unfocused-foreground = "${gruvbox.cream}";
        label-unfocused-background= "${gruvbox.black}";
        label-unfocused-padding = 2;
        label-visible = "%icon%";
        label-visible-padding = 2;
        label-urgent = "%icon%";
        label-urgent-font = 5;
        label-urgent-foreground = "${gruvbox.red-alt}";
        label-urgent-background = "${gruvbox.black}";
        label-urgent-padding = 2;
        label-separator = "|";
        label-separator-padding = 2;
        label-separator-foreground = "${gruvbox.transparent}";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        format-prefix = "      ";
        format-prefix-foreground = "${gruvbox.yellow-mat}";
        format-prefix-background = "${gruvbox.black}";
        label = "%class%";
        label-maxlen = 60;
        label-foreground = "${gruvbox.cream}";
        label-background = "${gruvbox.dark}";
        label-padding-left = 2;
        label-padding-right = 2;
      };

      "module/time" = {
        type = "internal/date";
        interval = 1;
        format-prefix = "      ";
        format-prefix-foreground = "${gruvbox.aqua}";
        format-prefix-background = "${gruvbox.black}";
        date = "%A  %d %b %Y | %H:%M:%S";
        label = "%date%";
        label-foreground = "${gruvbox.cream}";
        label-background = "${gruvbox.dark}";
        label-padding-left = 2;
        label-padding-right = 2;
      };

      "module/filesystem" = {
        type = "internal/fs";
        interval = 2;
        mount-0 = "/";
        format-mounted-prefix = "      ";
        format-mounted-prefix-foreground = "${gruvbox.red}";
        format-mounted-prefix-background= "${gruvbox.black}";
        label-mounted = "%free%";
        label-unmounted = "%mountpoint% not mounted";
        label-mounted-foreground = "${gruvbox.cream}";
        label-mounted-background= "${gruvbox.dark}";
        label-mounted-padding-left = 2;
        label-mounted-padding-right = 2;
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 1;
        format-prefix = "      ";
        format-prefix-foreground = "${gruvbox.orange-mat}";
        format-prefix-background= "${gruvbox.black}";
        label = "%percentage%%";
        label-foreground = "${gruvbox.cream}";
        label-background= "${gruvbox.dark}";
        label-padding-left = 2;
        label-padding-right = 2;
      };

      "module/temp" = {
        type = "internal/temperature";
        interval = 0.5;
        thermal-zone = 0;
        hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
        base-temperature = 20;
        warn-temperature = 70;
        units = true;
        format = "<label>";
        format-prefix = "        ";
        format-prefix-foreground= "${gruvbox.yellow-mat}";
        format-prefix-background= "${gruvbox.black}";
        label = "%temperature-c%";
        label-foreground = "${gruvbox.cream}";
        label-background= "${gruvbox.dark}";
        label-padding-left = 2;
        label-padding-right = 2;
        format-warn-prefix = "        ";
        format-warn-prefix-foreground = "${gruvbox.white}";
        format-warn-prefix-background = "${gruvbox.red-alt}";
        label-warn = "%temperature-c%";
        label-warn-foreground = "${gruvbox.white}";
        label-warn-background = "${gruvbox.red}";
        label-warn-padding-left = 2;
        label-warn-padding-right = 2;
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 1;
        format-prefix = "      ";
        format-prefix-foreground = "${gruvbox.blue}";
        format-prefix-background= "${gruvbox.black}";
        label = "%mb_used%";
        label-foreground = "${gruvbox.cream}";
        label-background= "${gruvbox.dark}";
        label-padding-left=2;
        label-padding-right=2;
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        format-volume-prefix = "     ";
        format-volume-prefix-foreground = "${gruvbox.blue-alt}";
        format-volume-prefix-background= "${gruvbox.black}";
        format-volume = "<label-volume>";
        label-volume = "%percentage%%";
        label-volume-foreground= "${gruvbox.cream}";
        label-volume-background= "${gruvbox.dark}";
        label-volume-padding-left = 2;
        label-volume-padding-right = 2;
        format-muted-prefix = "  󰝟   ";
        format-muted-foreground = "${gruvbox.orange}";
        format-muted-background = "${gruvbox.black}";
        label-muted = "muted";
        label-muted-foreground = "${gruvbox.orange-mat}";
        label-muted-background = "${gruvbox.dark}";
        label-muted-padding = 2;
      };

      "module/tray" = {
        type = "internal/tray";
        format = "<tray>";
        format-prefix = " 󱊖   ";
        format-prefix-foreground = "${gruvbox.orange}";
        format-prefix-background = "${gruvbox.black}";
        tray-spacing= "8px";
        format-padding="5px";
        format-background="${gruvbox.black}";
        tray-background = "${gruvbox.black}";
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
        format-charging-foreground = "${gruvbox.green}";
        format-charging-background = "${gruvbox.black}";
        label-charging = "%percentage%%";
        label-charging-foreground = "${gruvbox.cream}";
        label-charging-background = "${gruvbox.dark}";
        label-charging-padding= 2;
        format-discharging = "<ramp-capacity><label-discharging>";
        format-discharging-foreground = "${gruvbox.green-alt}";
        format-discharging-background = "${gruvbox.black}";
        label-discharging = "%percentage%%";
        label-discharging-foreground = "${gruvbox.cream}";
        label-discharging-background = "${gruvbox.dark}";
        label-discharging-padding= 2;
        format-full-prefix = "      ";
        format-full-foreground = "${gruvbox.aqua}";
        format-full-background = "${gruvbox.black}";
        label-full = "%percentage%%";
        label-full-foreground = "${gruvbox.cream}";
        label-full-background = "${gruvbox.dark}";
        label-full-padding = 2;
        label-low = "[  BATTERY LOW ] %percentage%%";
        label-low-foreground = "${gruvbox.black}";
        label-low-background = "${gruvbox.red-alt}";
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
        ramp-capacity-0-foreground = "${gruvbox.red-alt}";
        ramp-capacity-1-foreground = "${gruvbox.green-alt}";
        ramp-capacity-2-foreground = "${gruvbox.green-alt}";
        ramp-capacity-3-foreground = "${gruvbox.green-alt}";
        ramp-capacity-4-foreground = "${gruvbox.green-alt}";
        ramp-capacity-0-background = "${gruvbox.black}";
        ramp-capacity-1-background = "${gruvbox.black}";
        ramp-capacity-2-background = "${gruvbox.black}";
        ramp-capacity-3-background = "${gruvbox.black}";
        ramp-capacity-4-background = "${gruvbox.black}";
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
        format-prefix-foreground = "${gruvbox.yellow}";
        format-prefix-background = "${gruvbox.black}";
        format-padding-left = 2;
        format-padding-right = 2;
        label = "%percentage%%";
        label-foreground = "${gruvbox.cream}";
        label-background = "${gruvbox.dark}";
        label-padding-left = 2;
        label-padding-right = 2;
      };
    };
  };
}
