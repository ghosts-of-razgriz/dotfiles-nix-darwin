function fish_user_key_bindings
    fish_vi_key_bindings

    # alt+tab edit buffer in nvim
	bind -M insert ctrl-space  edit_command_buffer

    # jk for esc
    bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

    # ctrl-e to move to end of line
    bind -M insert \ce end-of-line

    # ctrl-p for previous
    bind -M insert \cp up-or-search

    bind -M insert \ez zell
    bind -M insert \cz dzell
end
