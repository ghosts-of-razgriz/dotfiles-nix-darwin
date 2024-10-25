{
  nixpkgs,
  configLib,
  ...
}:
{
  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "home/common"
      "home/pixy/fish.nix"
      "home/pixy/git.nix"
    ])
  ];
}
