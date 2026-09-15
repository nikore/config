{ pkgs, ... }: {
  programs.pi-coding-agent = {
    enable = true;
    settings = {
      defaultProvider = "openai-codex";
      defaultModel = "gpt-5.6-luna";
      defaultThinkingLevel = "xhigh";
      theme = "catppuccin-macchiato";
      compaction = {
        enabled = true;
        reserveTokens = 16384;
        keepRecentTokens = 50000;
      };
      retry = {
        enabled = true;
        maxRetries = 5;
      };
      enabledModels = [
        "claude-*"
        "gpt*"
      ];
      packages = [
        "npm:@hypabolic/pi-hypa"
        "npm:pi-web-access"
        "npm:pi-mcp-adapter"
        "npm:context-mode"
        "npm:pi-subagents"
        "npm:@tintinweb/pi-subagents"
        "npm:pi-lens"
        "npm:bigpowers"
        "npm:@dietrichgebert/ponytail"
        "npm:@sherif-fanous/pi-catppuccin"
        "npm:@narumitw/pi-goal"
        "npm:@juicesharp/rpiv-todo"
        "npm:@juicesharp/rpiv-ask-user-question"
        "npm:pi-background-tasks"
      ];
    };
    models = { };
  };
}
