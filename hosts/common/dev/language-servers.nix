{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lua-language-server
    nil
    emmet-language-server
    tailwindcss-language-server
    typescript-language-server
  ];
}
