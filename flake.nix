{
  description = "Hass' nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
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
          configVars
          configLib
          nixpkgs
          ;
      };
    in
    {
      # overlays
      overlays = import ./overlays { inherit inputs outputs; };

      # Custom packages to be shared or upstreamed.
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.pkgs.${system};
        in
        import ./pkgs { inherit pkgs; }
      );

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.pkgs.${system};
        in
        import ./checks { inherit inputs system pkgs; }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.pkgs.${system};
          checks = self.checks.${system};
        in
        import ./shell.nix { inherit checks pkgs; }
      );

      darwinConfigurations = {
        yellow4 = lib.darwinSystem {
          inherit specialArgs;
          modules = [
            # home-manager
            ./hosts/yellow4
          ];
        };
      };
    };
}
