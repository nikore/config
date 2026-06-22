{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        decorations = "None";
      };

      font = {
        size = 11;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Thin Italic";
        };
      };

      cursor.style = {
        shape = "Block";
        blinking = "Off";
      };

      env.TERM = "xterm-256color";
    };
  };
}
