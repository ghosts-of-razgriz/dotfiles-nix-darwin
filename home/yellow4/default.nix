{
  home-manager,
  configVars,
  configLib,
  nixpkgs,
  pkgs,
  lib,
  ...
}:
let
  importWithVars = path: import path { inherit lib pkgs configVars; };
in
{
  users.users."${configVars.username}" = {
    name = configVars.username;
    home = "/Users/${configVars.username}";
  };

  imports = [
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = false;
        users."${configVars.username}" = {
          home.username = configVars.username;
          home.homeDirectory = "/Users/${configVars.username}";
          home.stateVersion = "24.11";

          programs.home-manager.enable = true;
          imports = nixpkgs.lib.flatten [
            (map importWithVars (
              map configLib.relativeToRoot [
                "home/common/amethyst.nix"
                "home/common/fish.nix"
                "home/common/git.nix"
                "home/yellow4/git.nix"
                "home/common/raycast.nix"
                "home/common/ripgrep.nix"
                "home/common/ssh.nix"
                "home/common/starship.nix"
                "home/common/tmux.nix"
                "home/common/wezterm.nix"
              ]
            ))
          ];
        };
      };
    }
  ];
}
