{
  nixpkgs,
  configLib,
  ...
}:
{
  networking = {
    computerName = "cipher";
    hostName = "cipher";
    localHostName = "cipher";
  };

  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "hosts/common/core"
      "hosts/cipher/packages.nix"
      "hosts/cipher/apps.nix"
      "hosts/cipher/mas-apps.nix"
    ])
  ];
}
