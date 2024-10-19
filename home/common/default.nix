{
  nixpkgs,
  configLib,
  configVars,
  ...
}:
{
  home.username = configVars.username;
  home.homeDirectory = "/Users/${configVars.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  imports = nixpkgs.lib.flatten [
    (map configLib.relativeToRoot [
      "home/common/amethyst.nix"
      "home/common/fish.nix"
      "home/common/git.nix"
      "home/common/neovim.nix"
      "home/common/raycast.nix"
      "home/common/ripgrep.nix"
      "home/common/ssh.nix"
      "home/common/starship.nix"
      "home/common/tmux.nix"
      "home/common/wezterm.nix"
    ])
  ];
}
