{ inputs, pkgs, lib, host, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    settings = {
      xwayland.enabled = true;
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "$blue";
        "col.inactive_border" = "$surface2";

        layout = "dwindle";
      };
      exec-once = [
        "1password --silent"
        "systemctl --user start hyprpolkitagent"
        "jetbrains-toolbox --minimize"
        "xrandr --output DP-2 --primary"
        "dropbox start"
      ];
      monitor = [
        "DP-1, 1920x1080@164.92, 4480x0, 1"
        "DP-2, 2560x1440@180.00, 1920x0, 1"
        "DP-3, 1920x1080@164.92, 0x0, 1"
        "HDMI-A-1, 1920x1080@60.00, 0x1080, 1"
      ];
      workspace = [
        "1,monitor:DP-2"
        "2,monitor:DP-3"
        "3,monitor:DP-1"
        "4,monitor:HDMI-A-1"
        "5,monitor:DP-2"
        "6,monitor:DP-2"
        "7,monitor:DP-2"
        "8,monitor:DP-2"
        "9,monitor:DP-2"
      ];
      windowrule = [
        {
          name = "float-vol-control";
          "match:title" = "(.*Volume Control$)";
          float = true;
          size = "600 800";
          center = true;
        }
        {
          name = "terminal-workspace";
          "match:class" = "(.*ghostty)";
          workspace = 1;
        }
        {
          name = "discord-workspace";
          "match:class" = "(.*discord)";
          workspace = 2;
        }
        {
          name = "slack-workspace";
          "match:class" = "(.*Slack)";
          workspace = 2;
        }
        {
          name = "zen-workspace";
          "match:class" = "(.*zen-twilight)";
          workspace = 3;
        }
        {
          name = "brave-workspace";
          "match:class" = "(.*Brave)";
          workspace = 3;
        }
        {
          name = "Spotify-workspace";
          "match:class" = "(.*Spotify)";
          workspace = 4;
        }
        {
          name = "steam-workspace";
          "match:class" = "(steam)";
          workspace = 5;
        }
        {
          name = "steam-game-workspace";
          "match:title" = "(steam.*)";
          workspace = 5;
        }
        {
          name = "chrome-workspace";
          "match:title" = "(.*Google Chrome)";
          workspace = 6;
        }
      ];
      decoration = {
        rounding = 8;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "$teal";
          color_inactive = "0xff$baseAlpha";
        };
      };
      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        smart_split = true;
      };
      master = { new_status = "master"; };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
      ];
      "$mod" = "SUPER";
      bind = [
        "$mod, return, exec, ghostty"
        "$mod, space, exec, dms ipc call spotlight toggle"
        "$mod, s, exec, dms screenshot --no-file"
        "$mod, n, exec, thunar"
        "$mod, F, fullscreen"
        "$mod SHIFT, l, movewindow,r"
        "$mod SHIFT, h, movewindow,l"
        "$mod SHIFT, k, movewindow,u"
        "$mod SHIFT, j, movewindow,d"
        "$mod, l, swapwindow,r"
        "$mod, h, swapwindow,l"
        "$mod, k, swapwindow,u"
        "$mod, j, swapwindow,d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, v, exec, dms ipc call clipboard toggle"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, q, killactive,"
        "$mod SHIFT, T, togglefloating"
        "$mod SHIFT, l, movefocus, r"
        "$mod SHIFT, h, movefocus, l"
        "$mod SHIFT, k, movefocus, u"
        "$mod SHIFT, j, movefocus, d"
        "$mod SHIFT, z, exec, dms ipc call lock lock"
        "$mod CTRL, s, exec, dms ipc call settings toggle"
        "$mod CTRL, q, exit"
        "ALT, Tab, cyclenext"
      ];
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}
