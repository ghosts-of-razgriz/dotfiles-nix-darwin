{ pkgs, myPkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gopls
    lua-language-server
    emmylua-ls
    nil
    tinymist
    typescript-language-server
  ];
}
