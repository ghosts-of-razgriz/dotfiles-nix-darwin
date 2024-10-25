{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    datagrip
  ];
}
