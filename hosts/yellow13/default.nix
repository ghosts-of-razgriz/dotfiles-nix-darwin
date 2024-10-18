{
  nixpkgs,
  configLib,
  ...
}:
{
  networking = {
    computerName = "yellow13";
    hostName = "yellow13";
    localHostName = "yellow13";
  };

  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "hosts/common/core"
      "hosts/yellow13/packages.nix"
      "hosts/yellow13/apps.nix"
    ])
  ];
}
