{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    stylua
    nixfmt-rfc-style
    prettierd
    biome
    rufo
    rubyPackages_3_4.erb-formatter
  ];
}
