{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    archiver
    linear-linear
    permute
    morgen
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
      "clion"
      "rubymine"
      "elmedia-player"
      "ledger-live"
      "nordvpn"
      "kaleidoscope@3"
      "zen-browser@twilight"
    ];
  };
}
