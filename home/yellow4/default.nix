{
  nixpkgs,
  configLib,
  ...
}:
{
  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "home/common"
      "home/yellow4/fish.nix"
      "home/yellow4/git.nix"
    ])
  ];
}
