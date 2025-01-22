{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    archiver
    linear-linear
    permute
    onlyoffice
    slack
    signal
    plex
  ];

  homebrew = {
    casks = [
      "adobe-acrobat-pro"
      "arc"
      "datagrip"
      "elmedia-player"
      "firefox@nightly"
      "ledger-live"
      "nordvpn"
    ];
  };
}
