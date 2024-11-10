{ pkgs, ... }:
{

  environment.systemPackages = with pkgs.brewCasks; [
    archiver
    linear-linear
    permute
    onlyoffice
    slack
  ];

  homebrew = {
    casks = [
      "arc"
      "firefox@nightly"
      "nordvpn"
    ];
  };
}
