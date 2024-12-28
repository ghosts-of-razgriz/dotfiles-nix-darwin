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

    ghostty.url = "github:ghostty-org/ghostty";

    nix-inspect.url = "github:bluskript/nix-inspect";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      brew-nix,
      ghostty,
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
      hostArgs = configVars: {
        inherit
          inputs
          outputs
          configLib
          configVars
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
          specialArgs = hostArgs configVars.yellow4;
          modules = [
            ./overlays
            brew-nix.darwinModules.default

            ./hosts/yellow4
            ./home/common/general.nix
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

        yellow13 = lib.darwinSystem {
          specialArgs = hostArgs configVars.yellow13;
          modules = [
            ./overlays
            brew-nix.darwinModules.default

            ./hosts/yellow13
            ./home/common/general.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = hostArgs configVars.yellow13;
                useGlobalPkgs = true;
                useUserPackages = false;
                users.${configVars.yellow13.username} = import ./home/yellow13;
              };
            }
          ];
        };

        pixy = lib.darwinSystem {
          specialArgs = hostArgs configVars.pixy;
          modules = [
            ./overlays
            brew-nix.darwinModules.default

            ./hosts/pixy
            ./home/common/general.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = hostArgs configVars.pixy;
                useGlobalPkgs = true;
                useUserPackages = false;
                users.${configVars.pixy.username} = import ./home/pixy;
              };
            }
          ];
        };

        cipher = lib.darwinSystem {
          specialArgs = hostArgs configVars.cipher;
          modules = [
            ./overlays
            brew-nix.darwinModules.default

            ./hosts/cipher
            ./home/common/general.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = hostArgs configVars.cipher;
                useGlobalPkgs = true;
                useUserPackages = false;
                users.${configVars.cipher.username} = import ./home/cipher;
              };
            }
          ];
        };

      };
    };
}
