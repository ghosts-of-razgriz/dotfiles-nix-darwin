{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "tart"
    ];

  environment.systemPackages = with pkgs; [
    nix
    nix-index
    git
    just

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
    tmux
    tree-sitter
    pam-reattach
    process-compose

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.nix-inspect.packages.${pkgs.system}.default

    tart
  ];

  homebrew = {
    brews = [
      "libyaml"
      "zellij"
    ];
  };
}
