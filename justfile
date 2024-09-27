default:
	@just --list

rebuild-pre:
	git add -N .

rebuild: rebuild-pre
	darwin-rebuild switch --flake .

init host: rebuild-pre
	nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake /Volumes/nix-darwin/#{{host}}

repl:
	nix develop --extra-experimental-features 'nix-command flakes'
