{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nix
    git
    just

    bat
    fd
    fzf
    jq
    libyaml
    mise
    ripgrep
    starship
    tmux
    tree-sitter
  ];
}
