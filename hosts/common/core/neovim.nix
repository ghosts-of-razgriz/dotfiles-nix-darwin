{ pkgs, ... }:
{
  # lsp and formatters
  environment.systemPackages = with pkgs; [
    # c
    ccls
    clang-tools

    # nix
    nil
    nixfmt-rfc-style

    # go
    gopls
    gotools

    # lua
    lua-language-server
    stylua

    # rust
    rust-analyzer
    rustfmt

    # python
    pylyzer
    ruff
  ];
}
