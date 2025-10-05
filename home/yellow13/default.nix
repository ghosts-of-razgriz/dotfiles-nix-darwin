{ config, configVars, ... }:
{

  xdg.configFile."1Password/ssh/agent.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/1password/${configVars.hostname}.agent.toml";
    force = true;
  };

  imports = [
    ../common
    ./git.nix
  ];
}
