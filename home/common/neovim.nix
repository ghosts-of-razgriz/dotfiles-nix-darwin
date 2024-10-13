{ pkgs, ... }:
let
  nvim = pkgs.fetchFromGitHub {
    owner = "ghosts-of-razgriz";
    repo = "dotfiles-nvim";
    rev = "main";
    sha256 = "sha256-fp0jDdMqMgkQTkrPFwlJB1LTkUJDaYN8zmiHDFC2TlQ=";
  };
in
{
  # xdg.configFile."nvim" = {
  #   source = nvim;
  #   recursive = true;
  # };
}
