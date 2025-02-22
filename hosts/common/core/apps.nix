{
  pkgs,
  lib,
  nixpkgs,
  ...
}:
let
  nonfree-unstable = import nixpkgs {
    localSystem = pkgs.system;
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "1password"
        "1password-cli"
      ];
  };
in
{
  # programs._1password.enable = true;
  # programs._1password.package = nonfree-unstable._1password;
  # programs._1password-gui-beta.enable = true;
  # programs._1password-gui-beta.package = nonfree-unstable._1password-gui;

  environment.systemPackages = with pkgs.brewCasks; [
    amethyst
    expressions
    homerow
    jordanbaird-ice
    maccy
    numi
    rapidapi
    raycast
    vscodium
    xmind

    ghostty
  ];

  homebrew = {
    enable = true;

    casks = [
      "1password@nightly"
      "1password-cli"
      "dash@6"
      "docker"
    ];
  };
}
