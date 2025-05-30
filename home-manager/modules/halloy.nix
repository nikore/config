{ config, pkgs, ... }:
{
  programs.halloy = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.halloy);
    settings = {
      buffer.channel.topic.enabled = true;
      theme = "catppuccin-macchiato";
      servers.liberachat = {
        nickname = "nikore";
        server = "irc.libera.chat";
        channels = [ "#halloy" ];
      };
    };
    themes = {
      catppuccin-macchiato = {
        general = {
          background = "#181926";
          border = "#6e738d";
          horizontal_rule = "#363a4f";
          unread_indicator = "#c6a0f6";
        };
        text = {
          primary = "#cad3f5";
          secondary = "#a5adcb";
          tertiary = "#c6a0f6";
          success = "#a6da95";
          error = "#ed8796";
        };
        buttons.primary = {
          background = "#181926";
          background_hover = "#1e2030";
          background_selected = "#24273a";
          background_selected_hover = "#1e2030";
        };
        buttons.secondary = {
          background = "#1e2030";
          background_hover = "#494d64";
          background_selected = "#363a4f";
          background_selected_hover = "#494d64";
        };
        buffer = {
          action = "#f5a97f";
          background = "#24273a";
          background_text_input = "#1e2030";
          background_title_bar = "#1e2030";
          border = "#181926";
          border_selected = "#b7bdf8";
          code = "#b7bdf8";
          highlight = "#494d64";
          nickname = "#91d7e3";
          selection = "#363a4f";
          timestamp = "#b8c0e0";
          topic = "#8087a2";
          url = "#8aadf4";
        };
        buffer.server_messages = {
          default = "#eed49f";
        };
      };
    };
  };
}
