{ inputs, pkgs, ... }:
{
  programs.opencode = {
    enable = true;
    package = inputs.opencode.packages.${pkgs.stdenv.hostPlatform.system}.opencode.overrideAttrs (old: {
      preBuild = (old.preBuild or "") + ''
        substituteInPlace packages/opencode/src/cli/cmd/generate.ts \
          --replace-fail 'const prettier = await import("prettier")' 'const prettier: any = { format: async (s: string) => s }' \
          --replace-fail 'const babel = await import("prettier/plugins/babel")' 'const babel = {}' \
          --replace-fail 'const estree = await import("prettier/plugins/estree")' 'const estree = {}'
        substituteInPlace package.json \
          --replace-fail '"packageManager": "bun@1.3.14"' '"packageManager": "bun@${pkgs.bun.version}"'
      '';
    });
    settings = {
      plugin = [
        "oh-my-openagent@latest"
        "@ex-machina/opencode-anthropic-auth@latest"
      ];
    };
  };
}
