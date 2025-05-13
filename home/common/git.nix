{ lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "Hass Khalid";
    ignores = [
      ".config/nvim/cache"
      ".config/nvim/tmp"
      ".ssh/known_hosts"
      ".DS_Store"
      ".devenv"
      ".direnv"
    ];
    aliases = {
      sla = "log --oneline --decorate --graph --all";
      co = lib.concatStringsSep " " [
        "!f() {"
        "git show-ref |"
        "cut -d/ -f3- |"
        "fzf-tmux |"
        "sed 's/remotes\\/origin\\///' |"
        "sed 's/tags\\///';"
        "};"
        "git checkout $(f)"
      ];
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      "color \"diff\"" = {
        old = "red bold";
        new = "green italic";
      };
      "color \"status\"" = {
        added = "green italic";
        changed = "blue";
        untracked = "magenta";
        branch = "yellow bold";
        unmerged = "red bold";
      };
      push = {
        default = "simple";
      };
      pull = {
        rebase = true;
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBRg9FKa03UuS/SPokIVQdfA7GMlHyjvTQRf6oPzAegY";
      };
    };
  };
}
