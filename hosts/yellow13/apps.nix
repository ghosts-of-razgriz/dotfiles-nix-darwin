{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    arc
    clop
    permute
    archiver
  ];
}
