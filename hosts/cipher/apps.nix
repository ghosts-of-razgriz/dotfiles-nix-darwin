{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.brewCasks; [
    notion-calendar
  ];

  homebrew = {
    casks = [
      "aws-vpn-client"
      "datagrip"
      "parallels"
    ];
  };
}
