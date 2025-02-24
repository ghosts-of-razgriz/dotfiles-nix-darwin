{
  config,
  configVars,
  pkgs,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [
    "root"
    configVars.username
  ];

  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.bash.enable = true;

  environment = {
    shells = with pkgs; [
      bash
      zsh
      fish
    ];
  };

  system.configurationRevision = config.rev or config.dirtyRev or null;
  system.stateVersion = 5;

  brew-nix.enable = true;

  imports = [
    ./packages.nix
    ./general.nix
    ./dock.nix
    ./finder.nix
    ./apps.nix
    ./mas-apps.nix
    ./neovim.nix
  ];
}
