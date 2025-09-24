{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    stylua
    nixfmt-rfc-style
    gotools
    typstyle
  ];
}
