{ pkgs, ... }:
{

  environment.systemPackages = with pkgs.brewCasks; [
    archiver
    clop
    linear-linear
    permute
    onlyoffice
  ];

  homebrew = {
    casks = [
      "arc"
      "firefox@nightly"
      "nordvpn"
    ];
  };
}
