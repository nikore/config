{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        blur = true;
        decorations = "None";
        startup_mode = "Maximized";
      };
      selection = {
        save_to_clipboard = true;
      };
      font = {
        size = 11.25;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };

      };
      cursor.style = {
        shape = "Block";
        blinking = "Off";
      };
      terminal = {
        shell = "${pkgs.zsh}/bin/zsh";
      };
      hints = {
        enabled = [
          {
            command = "xdg-open";
            hyperlinks = true;
            post_processing = true;
            mouse = {
              enabled = true;
            };
            regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>\"\\s{-}\\^⟨⟩`\\\\]+";
          }
        ];
      };

      env.TERM = "xterm-256color";
    };
  };
}
