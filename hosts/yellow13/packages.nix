{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    rsync

    tart
  ];
}
