{
  description = "Hass' nix config";

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
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { nixpkgs = nixpkgs; };
      specialArgs = {
        inherit
          inputs
          outputs
          configLib
          home-manager
          nixpkgs
          ;
      };
    in
    {

      overlays = import ./overlays { inherit inputs outputs; };

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./shell.nix { inherit pkgs; }
      );

      darwinConfigurations = {
        yellow4 = lib.darwinSystem {
          specialArgs = specialArgs // {
            configVars = configVars.yellow4;
          };
          modules = [
            ./hosts/yellow4
            ./home

            ./overlays
          ];
        };
      };
    };
}
