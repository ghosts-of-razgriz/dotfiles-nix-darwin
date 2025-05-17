{ config, configVars, ... }:
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
    includes = [
      "${configVars.hostname}.config"
    ];
  };

  home.file.".ssh/${configVars.hostname}.config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/ssh/${configVars.hostname}.config";
    force = true;
  };

  home.file.".ssh/authorized_keys" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/ssh/authorized_keys";
    force = true;
  };
}
