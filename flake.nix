{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      inherit (nix-darwin) lib;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
      ];
      configVars = import ./vars.nix { inherit inputs lib; };
      hostArgs = configVars: {
        inherit
          inputs
          outputs
          configVars
          home-manager
          nixpkgs
          ;
      };
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );

      darwinConfigurations = {
        yellow4 = lib.darwinSystem {
          specialArgs = hostArgs configVars.yellow4;
          modules = [
            ./hosts/yellow4
            ./home/home-manager.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = hostArgs configVars.yellow4;
                useGlobalPkgs = true;
                useUserPackages = false;
                users.${configVars.yellow4.username} = import ./home/yellow4;
              };
            }
          ];
        };
      };
    };
}
