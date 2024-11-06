{ config, ... }:
{
  xdg.configFile."zellij" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/zellij";
  };
}
