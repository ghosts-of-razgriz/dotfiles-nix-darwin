{ ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      set --export CDPATH $CDPATH $HOME/code/1password
    '';
  };
}
