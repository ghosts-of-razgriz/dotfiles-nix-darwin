{
  nixpkgs,
  configLib,
  ...
}:
{
  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "home/common"
      "home/yellow13/fish.nix"
      "home/yellow13/git.nix"
    ])
  ];
}
