default:
	@just --list

brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

dotfiles-neovim:
	if [ ! -d $HOME/code/dotfiles/nvim ]; then \
		git clone git@github.com:ghosts-of-razgriz/dotfiles-nvim.git $HOME/code/dotfiles/nvim; \
	fi;

dotfiles-nix:
	git clone git@github.com:ghosts-of-razgriz/dotfiles-nix-darwin.git $HOME/code/dotfiles/nix-darwin

init host:
	@if [ ! -d "/opt/homebrew" ]; then just brew-install; fi
	nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake .#{{host}}

pre:
	git add -N .

dev: pre
	darwin-rebuild switch --flake .

rebuild:
	darwin-rebuild switch --flake .

trace:
	darwin-rebuild switch --flake . --show-trace

update input:
	nix flake lock --update-input {{input}}

repl:
	nix develop --extra-experimental-features 'nix-command flakes'
