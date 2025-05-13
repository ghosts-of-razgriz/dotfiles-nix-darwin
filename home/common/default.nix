{
  nixpkgs,
  config,
  configVars,
  lib,
  ...
}:
{
  options.dotfilesPath = lib.mkOption {
    type = lib.types.str;
    default = "${config.home.homeDirectory}/code/dotfiles/nix-darwin/dotfiles";
    description = "Path to dotfiles directory";
  };

  config = {
    home.username = configVars.username;
    home.homeDirectory = "/Users/${configVars.username}";
    home.stateVersion = "24.11";

    programs.home-manager.enable = true;

    xdg.configFile."amethyst/amethyst.yml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/amethyst/amethyst.yml";
    };

    xdg.configFile."ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/ghostty/config";
    };

    xdg.configFile."mise/config.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/mise/config.toml";
    };

    xdg.configFile."nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/nvim";
    };

    xdg.configFile."raycast/latest.rayconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/raycast/latest.rayconfig";
    };

    xdg.configFile."zellij/config.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/zellij/config.kdl";
    };
    xdg.configFile."zellij/layouts" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/zellij/layouts";
      recursive = true;
    };
  };

  imports = [
    ./direnv.nix
    ./fish.nix
    ./ssh.nix
    ./git.nix
    ./ripgrep.nix
    ./starship.nix
  ];
}
