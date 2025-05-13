{
  nixpkgs,
  configLib,
  ...
}:
{

  imports = [
    ../common
    ./git.nix
  ];
}
