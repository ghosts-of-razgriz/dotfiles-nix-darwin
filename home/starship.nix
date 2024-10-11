{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "$character"
      ];
      right_format = lib.concatStrings [
        "$all"
      ];
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[•](bold red)";
        vimcmd_symbol = "[](bold blue)";
        vimcmd_replace_one_symbol = "[](bold purple)";
        vimcmd_replace_symbol = "[](bold purple)";
        vimcmd_visual_symbol = "[](bold yellow)";
      };

      docker_context.symbol = " ";
      lua.symbol = "󰢱 ";
      golang.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      typst.symbol = "󰰤 ";

      git_status = {
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇡\${ahead_count}⇣\${behind_count}";
      };
    };
  };
}
