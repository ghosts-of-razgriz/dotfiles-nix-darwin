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
      "clion"
      "rubymine"
      "elmedia-player"
      "firefox@nightly"
      "ledger-live"
      "nordvpn"
      "kaleidoscope@3"
      "zen-browser"
    ];
  };
}
