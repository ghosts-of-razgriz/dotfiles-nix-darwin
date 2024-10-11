{ pkgs, ... }:
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

      # source ~/.config/fish/(hostname | tr [:upper:] [:lower:]).fish

      fish_config theme choose 'Catppuccin Mocha'

      # brew
      eval (/opt/homebrew/bin/brew shellenv)

      # programming languages
      ## Golang
      set --export GO111MODULE on
    '';
    shellAliases = {
      ssh = "TERM=xterm-256color command ssh";
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

  xdg.configFile."fish/themes" = {
    source = catppuccin + "/themes";
    recursive = true;
  };

  xdg.configFile."fish/conf.d/fzf.fish" = {
    source = ../dotfiles/fish/conf.d/fzf.fish;
  };

  xdg.configFile."fish/conf.d/fzf_tmux.fish" = {
    source = ../dotfiles/fish/conf.d/fzf_tmux.fish;
  };

  xdg.configFile."fish/conf.d/keybinding.fish" = {
    source = ../dotfiles/fish/conf.d/keybinding.fish;
  };
}
