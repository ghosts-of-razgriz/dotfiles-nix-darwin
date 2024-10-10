{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    clop
    permute
    archiver
  ];
}
