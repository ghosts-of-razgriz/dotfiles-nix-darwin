{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      zellij = prev.zellij.overrideAttrs (previousAttrs: rec {
        version = "0.41.0";
        src = prev.fetchFromGitHub {
          owner = "zellij-org";
          repo = "zellij";
          rev = "v${version}";
          sha256 = "sha256-EUoJHM0Jm0uFKFeHhtzon/ZRC615SHfYa1gr4RnCNBw=";
        };
        cargoHash = ""; # not able to determine this
      });
    })
  ];
}
