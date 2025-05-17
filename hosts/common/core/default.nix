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

  environment.shells = with pkgs; [
    fish
    zsh
    bash
  ];

  networking = {
    computerName = "${configVars.hostname}";
    hostName = "${configVars.hostname}";
    localHostName = "${configVars.hostname}";
  };

  system.configurationRevision = config.rev or config.dirtyRev or null;
  system.stateVersion = 6;

  imports = [
    ./packages.nix
    ./general.nix
    ./dock.nix
    ./finder.nix
    ./apps.nix
    ./mas.nix
  ];
}
