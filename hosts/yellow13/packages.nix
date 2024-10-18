{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "tart"
    ];

  environment.systemPackages = with pkgs; [
    tart
  ];
}
