{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    awscli2
    saml2aws
    spacectl
    go-task
  ];
}
