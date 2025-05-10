list:
	@just --list

mod dev 'just/dev.just'

import 'just/commands.just'

init host:
	@just run_on {{host}} '{{install_nix}}'
	@just run_on {{host}} '{{install_homebrew}}'
	@just run_on {{host}} '{{enable_filevault}}'
	@just run_on {{host}} '{{clone_dotfiles_nix}}'

debug:
	@just run_on 'yellow4' '{{clone_dotfiles_nix}}'
