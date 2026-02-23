{ pkgs, inputs, ... }: {
  programs.dank-material-shell = {
    enable = true;
    dgop.package =
      inputs.dgop.packages.${pkgs.stdenv.hostPlatform.system}.default;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    plugins = {
      mediaPlayer = {
        enable = true;
        settings = { preferredSource = "spotify"; };
      };
      calculator.enable = true;
      commandRunner.enable = true;
      dockerManager.enable = true;
      emojiLauncher.enable = true;
      kubernetes.enable = true;
      nixMonitor.enable = true;
    };
  };

  programs.dsearch.enable = true;

  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command =
          "${pkgs.tuigreet}/bin/tuigreet --width '180' --time --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' --cmd '${pkgs.uwsm}/bin/uwsm start ${inputs.hyprland.packages.x86_64-linux.hyprland}/share/wayland-sessions/hyprland.desktop'";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  users.users.greeter = {
    isNormalUser = false;
    description = "greetd greeter user";
    extraGroups = [ "video" "audio" ];
    linger = true;
  };

  environment.systemPackages = with pkgs; [ tuigreet ];
}
