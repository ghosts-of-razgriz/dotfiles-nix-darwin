{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nix
    nix-index
    git
    just
    nh

    bat
    devenv
    direnv
    eza
    fd
    fzf
    gh
    jq
    mise
    ripgrep
    starship
    tree-sitter
    tree
    pam-reattach
    process-compose
    zellij

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    lua51Packages.lua
    lua51Packages.luarocks
  ];
}
