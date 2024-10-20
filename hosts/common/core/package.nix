{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixVersions.nix_2_19
    git
    just

    bat
    eza
    fd
    fzf
    gh
    jq
    libyaml
    mise
    ripgrep
    starship
    tmux
    tree-sitter
    pam-reattach

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.nix-inspect.packages.${pkgs.system}.default
  ];
}
