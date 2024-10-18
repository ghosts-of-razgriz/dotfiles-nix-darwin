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

    masApps = {
      Lungo = 1263070803;
      "World Clock Pro — Convert Time" = 858446756;
    };
  };
}
