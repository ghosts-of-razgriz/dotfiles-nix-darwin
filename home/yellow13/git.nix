{ ... }:
{
  programs.git.includes = [
    { contents.user.email = "me@razgriz.io"; }
  ];
}
