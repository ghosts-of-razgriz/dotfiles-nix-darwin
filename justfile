list:
    @just --list

mod dev 'just/dev.just'

import 'just/commands.just'

init host:
    @just run_on {{ host }} '{{ install_nix }}'
    @just run_on {{ host }} '{{ install_homebrew }}'
    @just run_on {{ host }} '{{ enable_filevault }}'
    @just run_on {{ host }} '{{ clone_dotfiles_nix }}'
    @just run_on {{ host }} '{{ cd_dotfiles_nix }} {{ nix_shell_cmd }} {{ flake_bootstrap }} {{ host }}'
    @just run_on {{ host }} '{{ switch_shell }}'

rebuild:
    {{ darwin_rebuild }}

rebuild-remote host:
    @just run_on {{ host }} '{{ cd_dotfiles_nix }} {{ darwin_rebuild }}'

remote-repl host:
    @just run_on {{ host }} '{{ cd_dotfiles_nix }} nix develop --extra-experimental-features "nix-command flakes"'

ssh host:
    @just run_on {{ host }}

remote-debug host cmd='':
    @just run_on {{ host }} '{{ cmd }}'

debug host:
    @just run_on {{ host }} 'echo hello world'
