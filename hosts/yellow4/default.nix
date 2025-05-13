{ ... }:
{
  networking = {
    computerName = "yellow4";
    hostName = "yellow4";
    localHostName = "yellow4";
  };

  imports = [
    ../common
    ./apps.nix
  ];
}
