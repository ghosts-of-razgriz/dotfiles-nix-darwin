{ pkgs, ... }:
{
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # lsp and formatters
  environment.systemPackages = with pkgs; [
    # c
    ccls
    clang-tools

    # c#
    csharp-ls
    csharpier

    # nix
    nil
    nixfmt-rfc-style

    # go
    gopls
    gotools

    # html css javascript
    emmet-language-server
    tailwindcss-language-server
    typescript-language-server

    # lua
    lua-language-server
    stylua

    # rust
    rust-analyzer
    rustfmt

    # python
    pylyzer
    ruff

    # typst
    tinymist
    typstyle

    # zig
    zls
  ];
}
