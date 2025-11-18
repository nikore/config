{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.emptyDirectory;
    settings = [
      {
        layer = "top";
        output = "DP-2";
        height = 20;
        spacing = 5;
        margin-top = 5;
        margin-right = 5;
        margin-left = 5;

        modules-left = [
          "custom/rofi"
          "hyprland/workspaces"
          "hyprland/window"
          "hyprland/submap"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network"
          "disk"
          "cpu"
          "memory"
          "temperature"
          "pulseaudio"
          "tray"
        ];

        "custom/rofi" = {
          format = "<span></span>";
          on-click = "rofi -show drun -disable-history -show-icons";
          escape = true;
          tooltip = false;
        };

        tray = {
          icon-size = 16;
          spacing = 8;
          tooltip = true;
        };

        clock = {
          format = "<span color='#202020' bgcolor='#8ec07c'>  </span> {:%a %d | %H:%M}";
          tooltip = true;
          interval = 1;
          on-click = "gsimplecal";
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };

        disk = {
          format = "<span color='#202020' bgcolor='#ea6962'>  </span> {free}";
          interval = 20;
        };

        network = {
          interval = 2;
          format = "<span color='#202020' bgcolor='#d3869b'> 󱘖 </span> {bandwidthDownBits}";
          format-wifi = "<span color='#202020' bgcolor='#d3869b'> {icon} </span> {bandwidthDownBits}";
          format-ethernet = "<span color='#202020' bgcolor='#d3869b'> 󰈀 </span> {bandwidthDownBits}";
          format-icons = [
            "󰤫"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          tooltip = false;
          states = {
            normal = 25;
          };
        };

        cpu = {
          format = "<span color='#202020' bgcolor='#e78a4e'>  </span> {usage}%";
          tooltip = false;
          interval = 1;
        };

        memory = {
          format = "<span color='#202020' bgcolor='#458588'>  </span> {percentage}";
          interval = 2;

          states = {
            critical = 80;
          };

          tooltip = true;
        };

        temperature = {
          tooltip = false;
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
          critical-threshold = 70;
          format = "<span color='#202020' bgcolor='#d8a657'> 󰴈 </span> {temperatureC}°C";
          format-critical = "<span color='#202020' bgcolor='#cc241d'>  </span> {temperatureC}°C";
        };

        "hyprland/submap" = {
          format = " {}";
          max-length = 50;
        };

        pulseaudio = {
          scroll-step = 1;
          format = "<span color='#202020' bgcolor='#83a598'>  </span> {volume}%";
          format-muted = "<span color='#202020' bgcolor='#ea6962'>  </span> {volume}%";
          format-bluetooth = "<span color='#202020' bgcolor='#83a598'> 󰂰 </span> {volume}%";
          format-bluetooth-muted = "<span color='#202020' bgcolor='#ea6962'>󰂲</span> {volume}%";
          format-source = "{volume}% ";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "pavucontrol";
          tooltip = false;
          max-volume = 130;
        };

        "hyprland/window" = {
          format = "<span color='#202020' bgcolor='#d3869b'> 󰣆 </span> {class}";
          separate-outputs = true;
          icon = true;
          tooltip = false;
          expand = true;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          active-only = false;
          all-outputs = true;
          warp-on-scroll = false;
          sort-by-number = true;
          format = "{icon}";
          format-icons = {
            "1" = "<span>󰧨</span>";
            "2" = "<span></span>";
            "3" = "<span>󰈹</span>";
            "4" = "<span></span>";
            "5" = "<span>󰚀</span>";
            "6" = "<span></span>";
            "7" = "<span>󱓷</span>";
            "8" = "<span>󰚀</span>";
            "9" = "<span></span>";
          };
          persistent-workspaces = {
            DP-2 = [
              3
              5
              6
              7
              8
              9
            ];
            DP-1 = [ 2 ];
            DP-3 = [ 4 ];
            HDMI-A-1 = [ 1 ];
          };
        };
      }
    ];

    style = lib.mkDefault ./style.css;
  };
}
