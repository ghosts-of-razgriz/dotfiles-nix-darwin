{ home-manager, configVars, ... }:
{
  imports = [
    home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users."${configVars.username}" = {
          home.username = configVars.username;
          home.homeDirectory = "/Users/${configVars.username}";
          home.stateVersion = "24.11";

          programs.home-manager.enable = true;
        };
      };
    }
  ];
  users.users."${configVars.username}" = {
    name = configVars.username;
    home = "/Users/${configVars.username}";
  };
}
