{
  nixpkgs,
  configLib,
  ...
}:
{
  networking = {
    computerName = "yellow4";
    hostName = "yellow4";
    localHostName = "yellow4";
  };

  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "hosts/common/core"
    ])
  ];
}
