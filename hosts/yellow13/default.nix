{ ... }:
{
  networking = {
    computerName = "yellow13";
    hostName = "yellow13";
    localHostName = "yellow13";
  };

  imports = [
    ../common
    ./apps.nix
  ];
}
