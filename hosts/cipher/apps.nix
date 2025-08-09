{ pkgs, ... }:
{
  homebrew = {
    brews = [
      "helm"
    ];

    casks = [
      "aws-vpn-client"
      "goland"
    ];
  };
}
