{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libyaml
    gdbm
  ];
}
