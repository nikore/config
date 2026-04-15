{ inputs, ... }:
{
  programs.agent-skills = {
    enable = true;
    sources = {
      anthropic = {
        path = inputs.anthropic-skills;
        subdir = "skills";
      };
      vercel-cli = {
        path = inputs.vercel-skills-cli;
        subdir = "skills";
      };
    };
    skills = {
      enableAll = true;
    };
    targets = {
      agents = {
        dest = ".agents/skills";
        structure = "link";
      };
    };
  };
}
