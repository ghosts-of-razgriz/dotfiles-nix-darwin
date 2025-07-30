{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gopls
    lua-language-server
    nil
    emmet-language-server
    tailwindcss-language-server
    typescript-language-server
  ];
}
