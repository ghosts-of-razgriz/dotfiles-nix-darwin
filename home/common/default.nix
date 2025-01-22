{
  nixpkgs,
  config,
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
      "home/common/fish.nix"
      "home/common/git.nix"
      "home/common/mise.nix"
      "home/common/ripgrep.nix"
      "home/common/ssh.nix"
      "home/common/starship.nix"
      "home/common/tmux.nix"
    ])
  ];

  xdg.configFile."amethyst/amethyst.yml" = {
    source = ../../dotfiles/amethyst/amethyst.yml;
  };

  xdg.configFile."ghostty/config" = {
    source = ../../dotfiles/ghostty/config;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/nvim";
  };

  xdg.configFile."raycast/latest.rayconfig" = {
    source = ../../dotfiles/raycast/latest.rayconfig;
  };

  xdg.configFile."zellij" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/zellij";
  };
}
