{ config, pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nix.settings.experimental-features = "nix-command flakes";
  services.nix-daemon.enable = true;

  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.bash.enable = true;

  environment = {
    shells = with pkgs; [
      bash
      zsh
      fish
    ];
    loginShell = pkgs.fish;
  };

  system.configurationRevision = config.rev or config.dirtyRev or null;
  system.stateVersion = 5;

  brew-nix.enable = true;

  imports = [
    ./package.nix
    ./general.nix
    ./dock.nix
    ./finder.nix
    ./apps.nix
  ];
}
