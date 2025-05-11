{
  nixpkgs,
  config,
  configLib,
  configVars,
  ...
}:
{
  home.username = configVars.username;
  home.homeDirectory = "/Users/${configVars.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  imports = [
    ./fish.nix
  ];
}
