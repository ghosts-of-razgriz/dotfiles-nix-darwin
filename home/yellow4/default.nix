{
  nixpkgs,
  configLib,
  ...
}:
{
  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "home/common"
    ])
  ];
}
