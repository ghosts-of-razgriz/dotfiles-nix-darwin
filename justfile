list:
	@just --list

mod dev 'just/dev.just'

import 'just/commands.just'

init host:
	@just run_on {{host}} '{{install_nix}}'
	@just run_on {{host}} '{{install_homebrew}}'
	@just run_on {{host}} '{{enable_filevault}}'
	@just run_on {{host}} '{{clone_dotfiles_nix}}'
	@just run_on {{host}} '{{cd_dotfiles_nix}} {{nix_cmd}} {{flake_bootstrap}} .#{{host}}'

rebuild:
	{{darwin_rebuild}}

rebuild-remote host:
	@just run_on {{host}} '{{cd_dotfiles_nix}} {{darwin_rebuild}}'

ssh host:
	@just run_on {{host}}
