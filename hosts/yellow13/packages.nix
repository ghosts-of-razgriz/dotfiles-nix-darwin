{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rsync
    devenv
    sshpass
  ];
}
