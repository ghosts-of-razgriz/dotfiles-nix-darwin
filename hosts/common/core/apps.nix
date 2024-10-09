{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    amethyst
    jordanbaird-ice
    maccy
    numi
    raycast
    vscodium
  ];
}
