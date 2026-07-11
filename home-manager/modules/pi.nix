{ pkgs, ... }: {
  programs.pi-coding-agent = {
    enable = true;
    settings = {
      defaultProvider = "us.anthropic";
      defaultModel = "claude-opus-4-7";
      defaultThinkingLevel = "medium";
      theme = "dark";
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
        "npm:@tintinweb/pi-subagents"
        "npm:pi-lens"
        "npm:@dietrichgebert/ponytail"
      ];
    };
    models = { };
  };
}
