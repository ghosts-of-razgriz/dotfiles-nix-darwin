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
    loginShell = pkgs.zsh;
  };

  system.configurationRevision = config.rev or config.dirtyRev or null;
  system.stateVersion = 5;

  imports = [
    ./package.nix
  ];
}
