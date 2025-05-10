{ nixpkgs, configLib, ... }:
{
  networking = {
    computerName = "Yellow4";
    hostName = "Yellow4";
    localHostName = "Yellow4";
  };

  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "hosts/common"
    ])
  ];
}
