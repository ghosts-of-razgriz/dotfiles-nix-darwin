{ nixpkgs, ... }:
let
  lib = nixpkgs.lib;
in
{
  relativeToRoot = lib.path.append ../.;
}
