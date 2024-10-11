{
  home-manager,
  configVars,
  pkgs,
  ...
}:
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
          imports = [
            ./amethyst.nix
            (import ./fish.nix { inherit pkgs configVars; })
            (import ./ssh.nix { inherit configVars; })
            ./starship.nix
            ./tmux.nix
          ];
        };
      };
    }
  ];
}
