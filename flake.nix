{
  description = "Hass' nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    brew-api.url = "github:BatteredBunny/brew-api";
    brew-api.flake = false;

    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs.brew-api.follows = "brew-api";
      inputs.nix-darwin.follows = "nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    nix-inspect.url = "github:bluskript/nix-inspect";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      brew-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      inherit (nix-darwin) lib;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
      ];
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { inherit nixpkgs; };
      specialArgs = {
        inherit
          inputs
          outputs
          configLib
          home-manager
          brew-nix
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
            brew-nix.darwinModules.default
            ./hosts/yellow4
            ./home/yellow4

            ./overlays
          ];
        };
        yellow13 = lib.darwinSystem {
          specialArgs = specialArgs // {
            configVars = configVars.yellow13;
          };
          modules = [
            brew-nix.darwinModules.default
            ./hosts/yellow13
            ./home/yellow13

            ./overlays
          ];
        };
      };
    };
}
