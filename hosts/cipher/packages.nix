{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libyaml
    gdbm
    awscli2

    age
    eksctl
    kubelogin-oidc
    k9s
    kyverno
    sops
    tektoncd-cli
    yq
    flux
    kubectl
    kubectx
    go-task

    saml2aws
  ];
}
