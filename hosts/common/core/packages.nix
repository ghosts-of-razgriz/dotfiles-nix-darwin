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
    pam-reattach
    process-compose
    ripgrep
    starship
    tree
    tree-sitter
    websocat
    zellij

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    lua51Packages.lua
    lua51Packages.luarocks
  ];
}
