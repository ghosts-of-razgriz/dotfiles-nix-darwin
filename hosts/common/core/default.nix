{ nixpkgs, pkgs, ... }:
{
  nix.settings.experimental-features = "nix-command flakes";
  services.nix-daemon.enable = true;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";

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
}
