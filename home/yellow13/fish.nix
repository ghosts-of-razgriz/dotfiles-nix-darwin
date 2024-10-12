{ ... }:
{
  programs.fish.shellAliases = {
    qif-clean = "fd -e qif --exec sed i- '' 's/^M.*/M/' {}";
    qif-rm = "fd -e qif --exec rm -f {}";
  };
}
