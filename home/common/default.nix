{
  nixpkgs,
  config,
  configLib,
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
  };

  imports = [
    ./fish.nix
  ];
}
