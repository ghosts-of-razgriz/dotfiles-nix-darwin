{
  pkgs,
  lib,
  config,
  configVars,
  ...
}:
let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "cc8e4d8fffbdaab07b3979131030b234596f18da";
    sha256 = "sha256-udiU2TOh0lYL7K7ylbt+BGlSDgCjMpy75vQ98C1kFcc=";
  };
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting
      ulimit -n unlimited

      set --export CDPATH . $HOME $HOME/code $HOME/scratch $HOME/.config
      set --export EDITOR nvim
      set --export VISUAL nvim

      fish_config theme choose 'Catppuccin Mocha'

      # brew
      if test -d /opt/homebrew
        eval (/opt/homebrew/bin/brew shellenv)
      end

      # shell prompt
      if type -q starship
        starship init fish | source
      end

      # nix store path
      if test -d /run/current-system/sw/bin
        fish_add_path /run/current-system/sw/bin
      end

      # mise
      if type -q mise
        mise activate fish | source
      end

      # direnv
      if type -q direnv
        direnv hook fish | source
      end

      # programming languages
      ## Golang
      set --export GO111MODULE on
    '';
    shellAliases = {
      ssh = "TERM=xterm-256color command ssh";
    };
    shellAbbrs = {
      l = "eza";
    };
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
    ];
  };

  xdg.configFile."fish/conf.d/keybinding.fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/fish/conf.d/keybinding.fish";
  };

  xdg.configFile."fish/conf.d/fzf.fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/fish/conf.d/fzf.fish";
  };

  xdg.configFile."fish/conf.d/${configVars.hostname}.fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/fish/${configVars.hostname}.fish";
  };

  xdg.configFile."fish/themes" = {
    source = catppuccin + "/themes";
    recursive = true;
  };
}
