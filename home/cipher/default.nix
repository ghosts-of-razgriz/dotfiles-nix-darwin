{
  nixpkgs,
  configLib,
  ...
}:
{
  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "home/common"
      "home/cipher/fish.nix"
      "home/cipher/git.nix"
    ])
  ];
}
