{ ... }:
{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig = {
      tools = {
        usage = "latest";
        rust = "latest";
        python = "latest";
        deno = "latest";
      };
    };
  };
}
