{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    rsync
    tinymist

    tart
  ];
}
