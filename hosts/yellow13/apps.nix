{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    archiver
    linear-linear
    permute
    notion
    notion-calendar
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
      "logitech-g-hub"
      "nordvpn"
      "kaleidoscope@3"
      "zen-browser"
    ];
  };
}
