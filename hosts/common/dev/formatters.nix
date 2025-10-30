{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gotools
    nixfmt-rfc-style
    stylua
    superhtml
    typstyle
  ];
}
