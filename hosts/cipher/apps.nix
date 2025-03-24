{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
  ];

  homebrew = {
    casks = [
      "aws-vpn-client"
      "datagrip"
      "notion-calendar"
    ];
  };
}
