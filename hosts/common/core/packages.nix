{ pkgs, inputs, ... }:
{
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

    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    inputs.nix-inspect.packages.${pkgs.system}.default
  ];

  homebrew = {
    brews = [
      "libyaml"
    ];
  };
}
