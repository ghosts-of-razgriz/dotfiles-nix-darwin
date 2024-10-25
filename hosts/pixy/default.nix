{
  nixpkgs,
  configLib,
  ...
}:
{
  networking = {
    computerName = "pixy";
    hostName = "pixy";
    localHostName = "pixy";
  };

  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "hosts/common/core"
      "hosts/pixy/packages.nix"
      "hosts/pixy/apps.nix"
    ])
  ];
}
