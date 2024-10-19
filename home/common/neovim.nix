{ config, ... }:
{
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/nvim";
  };
}
