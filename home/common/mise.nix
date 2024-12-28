{ ... }:
{
  programs.mise = {
    enable = true;
    enableFishIntegration = false;
    globalConfig = {
      tools = {
        usage = "latest";

        deno = "latest";
        go = "latest";
        node = "latest";
        pnpm = "latest";
        python = "latest";
        ruby = "latest";
        rust = "latest";
        typst = "latest";
      };
    };
  };
}
