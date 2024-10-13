default:
	@just --list

brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

init host: brew-install
	nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake .#{{host}}

rebuild-pre:
	git add -N .

rebuild:
	darwin-rebuild switch --flake .

repl:
	nix develop --extra-experimental-features 'nix-command flakes'
