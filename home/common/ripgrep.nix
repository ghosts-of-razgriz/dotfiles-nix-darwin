{ ... }:
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--follow"
      "--smart-case"
      "--sort=path"
      "--glob=!{.git,.svn,node_modules,Trash,vendor}"
      "--glob=!{package-lock.json,flake.lock}"
    ];
  };
}
