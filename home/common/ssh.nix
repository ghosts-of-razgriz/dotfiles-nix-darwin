{ configVars, ... }:
{
  programs.ssh = {
    enable = true;
    extraOptionOverrides = {
      "IdentityAgent" = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    };
    includes = [
      "${configVars.hostname}.config"
    ];
  };

  home.file.".ssh/${configVars.hostname}.config" = {
    source = ../../dotfiles/ssh/${configVars.hostname}.config;
  };
}
