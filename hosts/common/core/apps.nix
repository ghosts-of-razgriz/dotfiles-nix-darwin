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
    morgen
    numi
    rapidapi
    raycast
    vscodium
    xmind
  ];

  homebrew = {
    enable = true;

    casks = [
      # "alfred"
      "dash@6"
      "1password@nightly"
      "wezterm"
    ];
  };
}
