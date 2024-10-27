{ ... }:
{
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig = {
      tools = {
        usage = "latest";

        deno = "latest";
        node = "latest";
        python = "latest";
        ruby = "latest";
        rust = "latest";
        typst = "latest";
      };
    };
  };
}
