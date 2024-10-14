{ pkgs, ... }:
{

  environment.systemPackages = with pkgs.brewCasks; [
    archiver
    clop
    linear-linear
    permute
  ];

  homebrew = {
    casks = [
      "arc"
      "firefox@nightly"
      "nordvpn"
    ];
  };
}
