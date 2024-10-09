{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixVersions.nix_2_19
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
