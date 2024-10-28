codeDir := "$HOME/code"
dotDir := "$codeDir/dotfiles"

default:
	@just --list

[private]
install-brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

install-fonts:
	if [ ! -d $codeDir/font-operator-mono ]; then \
		git clone git@github.com:ghosts-of-razgriz/font-operator-mono.git $codeDir/font-operator-mono; \
	fi
	open $codeDir/font-operator-mono/nerd-operator/*

dotfiles-neovim:
	if [ ! -d $HOME/code/dotfiles/nvim ]; then \
		git clone git@github.com:ghosts-of-razgriz/dotfiles-nvim.git $dotDir/nvim; \
	fi;

dotfiles-nix:
	git clone git@github.com:ghosts-of-razgriz/dotfiles-nix-darwin.git $dotDir/nix-darwin

init host:
	@if [ ! -d "/opt/homebrew" ]; then just install-brew; fi
	nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake .#{{host}}

init-post:
	chsh -s $(which -a fish | grep current-system)

[private]
pre:
	git add -N .

rebuild:
	darwin-rebuild switch --flake .

dev: pre rebuild

trace:
	darwin-rebuild switch --flake . --show-trace

ls-input:
	nix flake metadata --json | jq '.locks.nodes.root'

update input:
	nix flake lock --update-input {{input}}

ls:
	darwin-rebuild --list-generations

del:
	sudo nix-collect-garbage -d --delete-older-than 5d

repl:
	nix develop --extra-experimental-features 'nix-command flakes'
