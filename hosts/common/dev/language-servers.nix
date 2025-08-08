{ pkgs, myPkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gopls
    lua-language-server
    myPkgs.emmylua-ls
    nil
  ];
}
